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
    
    // MARK: Private Properties
    private var totalAmount: Double {
        return transactions.filter({ $0.isPinned })
            .map({ $0.transaction.amount} )
            .reduce(0.0, +)
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
    
    func formattedAmount(by category: TransactionModel.Category) -> String {
        return formattedAmount(by: .other(category))
    }
    
    func ratio(for categoryIndex: Int) -> Double {
        guard let category = TransactionModel.Category[categoryIndex] else { return 0.0 }
        return amount(by: .other(category)) / totalAmount
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
