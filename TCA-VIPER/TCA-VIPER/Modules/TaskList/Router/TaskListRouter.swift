import SwiftUI
import UIKit

protocol TaskListRouterProtocol {
    static func createModule() -> AnyView
}

final class TaskListRouter: TaskListRouterProtocol {
    static func createModule() -> AnyView {
        let interactor = TaskListInteractor()
        let presenter = TaskListPresenter()
        let presenterHolder = PresenterHolder()
        presenterHolder.presenter = presenter

        let view = TaskListView(presenterHolder: presenterHolder)

        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter

        return AnyView(view)
    }
}
