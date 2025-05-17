//
//  InMemoryTaskRepository.swift
//  TCA-VIPER
//
//  Created by Ariel Tyson on 17/5/25.
//

import Foundation

public protocol TaskRepositoryProtocol {
    func getAll() -> [Task]
    func get(by id: UUID) -> Task?
    func save(_ task: Task)
    func toggleCompletion(id: UUID)
}

public final class InMemoryTaskRepository: TaskRepositoryProtocol {
    private var store: [UUID: Task] = [:]
    private let queue = DispatchQueue(
        label: "com.yourcompany.InMemoryTaskRepository",
        qos: .userInitiated,
        attributes: .concurrent
    )

    public init(initialTasks: [Task] = []) {
        initialTasks.forEach { store[$0.id] = $0 }
    }

    public func getAll() -> [Task] {
        queue.sync {
            Array(store.values)
        }
    }

    public func get(by id: UUID) -> Task? {
        queue.sync {
            store[id]
        }
    }

    public func save(_ task: Task) {
        queue.async(flags: .barrier) {
            self.store[task.id] = task
        }
    }

    public func toggleCompletion(id: UUID) {
        queue.async(flags: .barrier) {
            guard var task = self.store[id] else { return }
            task.isComplete.toggle()
            self.store[id] = task
        }
    }
}
