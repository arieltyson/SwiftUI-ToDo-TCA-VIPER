//
//  TaskListViewProtocol.swift
//  TCA-VIPER
//
//  Created by Ariel Tyson on 17/5/25.
//

import SwiftUI

protocol TaskListViewProtocol: AnyObject {
    func showTasks(_ tasks: [Task])
    func showError(_ message: String)
}

struct TaskListView: View {
    weak var presenter: TaskListPresenterProtocol?
    @State private var newTitle = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("New Task", text: $newTitle)
                    Button("Add") {
                        presenter?.didTapAdd(title: newTitle)
                        newTitle = ""
                    }
                }.padding()

                List {
                    ForEach(presenter?.tasks ?? []) { task in
                        HStack {
                            Text(task.title)
                            Spacer()
                            Button {
                                presenter?.didToggleCompletion(id: task.id)
                            } label: {
                                Image(
                                    systemName: task.isComplete
                                        ? "checkmark.circle.fill" : "circle"
                                )
                            }
                        }
                    }
                }
            }
            .navigationTitle("VIPER ToDo")
            .onAppear { presenter?.viewDidLoad() }
        }
    }
}

extension TaskListView: TaskListViewProtocol {
    func showTasks(_ tasks: [Task]) {
        // Update local state if needed
    }

    func showError(_ message: String) {
        // Show error alert
    }
}
