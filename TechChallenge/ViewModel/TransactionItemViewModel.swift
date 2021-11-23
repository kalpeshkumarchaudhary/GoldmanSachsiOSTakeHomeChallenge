//
//  TransactionItemViewModel.swift
//  TechChallenge
//
//  Created by Kalpesh Chaudhary on 11/22/21.
//

import Foundation
import SwiftUI

struct TransactionItemViewModel {
    let transaction: TransactionModel
    var isPinned: Bool = true
    
    mutating func toggleIsPinned() {
        isPinned.toggle()
    }
    
    var categoryName: String {
        return transaction.category.rawValue
    }
    
    var categoryColor: Color {
        return transaction.category.color
    }
    
    var transactionImage: Image {
        return transaction.image
    }
    
    var transactionName: String {
        return transaction.name
    }
    
    var accountName: String {
        return transaction.accountName
    }
    
    var transactionAmount: String {
        return transaction.amount.formatted()
    }
    
    var transactionDate: String {
        return transaction.date.formatted
    }
}

extension TransactionItemViewModel: Identifiable {
    var id: Int {
        return transaction.id
    }
}

extension TransactionItemViewModel: Equatable {
    static func == (lhs: TransactionItemViewModel, rhs: TransactionItemViewModel) -> Bool {
        return lhs.transaction.id == rhs.transaction.id
    }
}
