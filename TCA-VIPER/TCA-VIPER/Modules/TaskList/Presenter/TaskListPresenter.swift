//
//  TaskListPresenter.swift
//  TCA-VIPER
//

import Foundation

protocol TaskListPresenterProtocol: AnyObject {
    var tasks: [Task] { get }
    func viewDidLoad()
    func didTapAdd(title: String)
    func didToggleCompletion(id: UUID)
}

final class TaskListPresenter: TaskListPresenterProtocol {
    var view: TaskListViewProtocol?
    var interactor: TaskListInteractorInputProtocol?
    var router: TaskListRouterProtocol?

    private(set) var tasks: [Task] = []

    func viewDidLoad() {
        interactor?.fetchTasks()
    }

    func didTapAdd(title: String) {
        guard !title.isEmpty else { return }
        interactor?.addTask(title: title)
    }

    func didToggleCompletion(id: UUID) {
        interactor?.toggleCompletion(id: id)
    }
}

extension TaskListPresenter: TaskListInteractorOutputProtocol {
    func tasksFetched(_ tasks: [Task]) {
        self.tasks = tasks
        view?.showTasks(tasks)
    }

    func taskOperationFailed(_ error: Error) {
        view?.showError(error.localizedDescription)
    }
}
