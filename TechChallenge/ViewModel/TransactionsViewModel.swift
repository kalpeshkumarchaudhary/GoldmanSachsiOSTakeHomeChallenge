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
    
    static let sampleViewModel: TransactionsViewModel = {
        return TransactionsViewModel(transactions: ModelData.sampleTransactions.map({ TransactionItemViewModel(transaction: $0)}))
    }()
}
