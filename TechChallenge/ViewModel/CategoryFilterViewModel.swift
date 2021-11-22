//
//  CategoryFilterViewModel.swift
//  TechChallenge
//
//  Created by Kalpesh Chaudhary on 11/22/21.
//

import Foundation
import SwiftUI

enum CategoryFilterViewModel {
    case all
    case other(TransactionModel.Category)
}

extension CategoryFilterViewModel: CaseIterable {
    static var allCases: [CategoryFilterViewModel] {
        var allCategories: [CategoryFilterViewModel] = [.all]
        allCategories.append(contentsOf: TransactionModel.Category.allCases.map({ .other($0) }))
        return allCategories
    }
}

extension CategoryFilterViewModel: Identifiable {
    var id: String {
        switch self {
        case .all:
            return "all"
        case .other(let category):
            return category.rawValue
        }
    }
}
