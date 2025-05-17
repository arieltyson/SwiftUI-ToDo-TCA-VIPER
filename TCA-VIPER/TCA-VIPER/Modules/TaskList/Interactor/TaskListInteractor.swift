//
//  TaskListInteractorInputProtocol.swift
//  TCA-VIPER
//
//  Created by Ariel Tyson on 17/5/25.
//

import Foundation

public protocol TaskListInteractorInputProtocol: AnyObject {
    func fetchTasks()
    func addTask(title: String)
    func toggleCompletion(id: UUID)
}

public protocol TaskListInteractorOutputProtocol: AnyObject {
    func tasksFetched(_ tasks: [Task])
    func taskOperationFailed(_ error: Error)
}

final class TaskListInteractor: TaskListInteractorInputProtocol {
    weak var presenter: TaskListInteractorOutputProtocol?
    private let dataManager: TaskListDataManagerProtocol

    init(dataManager: TaskListDataManagerProtocol = TaskListDataManager()) {
        self.dataManager = dataManager
    }

    func fetchTasks() {
        dataManager.fetchTasks { [weak self] result in
            switch result {
            case .success(let tasks):
                self?.presenter?.tasksFetched(tasks)
            case .failure(let error):
                self?.presenter?.taskOperationFailed(error)
            }
        }
    }

    func addTask(title: String) {
        dataManager.addTask(title: title) { [weak self] result in
            switch result {
            case .success:
                self?.fetchTasks()
            case .failure(let error):
                self?.presenter?.taskOperationFailed(error)
            }
        }
    }

    func toggleCompletion(id: UUID) {
        dataManager.toggleCompletion(id: id) { [weak self] result in
            switch result {
            case .success:
                self?.fetchTasks()
            case .failure(let error):
                self?.presenter?.taskOperationFailed(error)
            }
        }
    }
}
