//
//  PresenterHolder.swift
//  TCA-VIPER
//
//  Created by Ariel Tyson on 17/5/25.
//

import Combine

final class PresenterHolder: ObservableObject {
    var presenter: TaskListPresenterProtocol?
}
