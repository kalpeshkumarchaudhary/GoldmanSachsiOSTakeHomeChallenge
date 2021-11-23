//
//  TransactionsViewModel.swift
//  TechChallenge
//
//  Created by Kalpesh Chaudhary on 11/22/21.
//

import Foundation

class TransactionsViewModel: ObservableObject {
    @Published var transactions: [TransactionItemViewModel]
    
    // MARK: Initializer
    init(transactions: [TransactionItemViewModel] = []) {
        self.transactions = transactions
    }
    // MARK: Public Properties
    var transactionCategories: [TransactionModel.Category] {
        return TransactionModel.Category.allCases
    }
    
    // MARK: Public Methods
    func filterTransactions(by category: CategoryFilterViewModel) -> [TransactionItemViewModel] {
        switch category {
        case .all:
            return transactions
        case .other(let category):
            return transactions.filter { $0.transaction.category == category }
        }
    }
    
    func formattedAmount(by category: CategoryFilterViewModel) -> String {
        return amount(by: category).formatted(hasDecimals: true)
    }
    
    static let sampleViewModel: TransactionsViewModel = {
        return TransactionsViewModel(transactions: ModelData.sampleTransactions.map({ TransactionItemViewModel(transaction: $0)}))
    }()
}

// MARK: Private methods
extension TransactionsViewModel {
    private func amount(by category: CategoryFilterViewModel) -> Double {
        let transactions = filterTransactions(by: category).filter { $0.isPinned }
        let totalAmountByCategory = transactions.map({ $0.transaction.amount }).reduce(0.0, +)
        return totalAmountByCategory
    }
}
