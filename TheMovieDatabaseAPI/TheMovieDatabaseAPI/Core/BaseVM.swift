//
//  BaseVM.swift
//  TheMovieDatabaseAPI
//
//  Created by Ekrem TAŞKIRAN on 9.01.2022.
//

import Foundation

class BaseVM {
    private(set) var state = Observable(State.unknown)

    func setState(_ state: State) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.state.value = state
        }
    }
}

enum State {
    case unknown, loading, success, error

    static func == (left: State, right: State) -> Bool {
        switch (left, right) {
        case (.unknown, .unknown):
            return true
        case (.loading, .loading):
            return true
        case (.success, .success):
            return true
        case (.error, .error):
            return true
        default:
            return false
        }
    }
}
