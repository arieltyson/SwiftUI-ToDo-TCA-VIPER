//
//  TaskListDataManager.swift
//  TCA-VIPER
//
//  Created by Ariel Tyson on 17/5/25.
//

import Foundation

public protocol TaskListDataManagerProtocol {
    func fetchTasks(completion: @escaping (Result<[Task], Error>) -> Void)
    func addTask(
        title: String,
        completion: @escaping (Result<Void, Error>) -> Void
    )
    func toggleCompletion(
        id: UUID,
        completion: @escaping (Result<Void, Error>) -> Void
    )
}

final class TaskListDataManager: TaskListDataManagerProtocol {
    private let repository: InMemoryTaskRepository

    init(repository: InMemoryTaskRepository = .init()) {
        self.repository = repository
    }

    func fetchTasks(completion: @escaping (Result<[Task], Error>) -> Void) {

        let tasks = repository.getAll()
        completion(.success(tasks))
    }

    func addTask(
        title: String,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        repository.save(Task(title: title))
        completion(.success(()))
    }

    func toggleCompletion(
        id: UUID,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        repository.toggleCompletion(id: id)
        completion(.success(()))
    }
}
