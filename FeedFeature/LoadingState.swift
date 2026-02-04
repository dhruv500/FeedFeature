//
//  File 2.swift
//  UtilityLibrary
//
//  Created by Dhruv Jaiswal on 23/01/26.
//

import Foundation

public enum LoadingState<T: Equatable>: Equatable {
    case idle
    case loading
    case loaded(T)
    case error(String)

    var data: T? {
        if case let.loaded(value) = self { return value }
        return nil
    }

    var isLoading: Bool {
        if case .loading = self { return true}
        return false
    }

    var error: String? {
        if case let .error(message) = self { return message }
        return nil
    }
}
