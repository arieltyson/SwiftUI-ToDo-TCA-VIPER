import SwiftUI

protocol TaskListViewProtocol {
    func showTasks(_ tasks: [Task])
    func showError(_ message: String)
}

struct TaskListView: View {
    @StateObject private var viewModel = TaskListViewModel()

    @ObservedObject private var presenterHolder: PresenterHolder

    private var presenter: TaskListPresenterProtocol? {
        presenterHolder.presenter
    }

    // MARK: – New initializer
    init(presenterHolder: PresenterHolder) {
        _presenterHolder = ObservedObject(wrappedValue: presenterHolder)
    }

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("New Task", text: $viewModel.newTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Add") {
                        presenter?.didTapAdd(title: viewModel.newTitle)
                        viewModel.newTitle = ""
                    }
                }
                .padding()

                List(viewModel.tasks) { task in
                    HStack {
                        Text(task.title)
                        Spacer()
                        Button {
                            presenter?.didToggleCompletion(id: task.id)
                        } label: {
                            Image(
                                systemName: task.isComplete
                                    ? "checkmark.circle.fill"
                                    : "circle"
                            )
                        }
                    }
                }
            }
            .navigationTitle("VIPER ToDo")
            .onAppear { presenter?.viewDidLoad() }
        }
    }
}

// MARK: – Conformance

extension TaskListView: TaskListViewProtocol {
    func showTasks(_ tasks: [Task]) {
        DispatchQueue.main.async { viewModel.tasks = tasks }
    }

    func showError(_ message: String) {
        print("VIPER Error:", message)
    }
}

// MARK: – Helpers

private final class TaskListViewModel: ObservableObject {
    @Published var newTitle = ""
    @Published var tasks = [Task]()
}
