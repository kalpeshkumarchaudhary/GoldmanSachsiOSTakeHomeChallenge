//
//  TransactionItemViewModel.swift
//  TechChallenge
//
//  Created by Kalpesh Chaudhary on 11/22/21.
//

import Foundation

struct TransactionItemViewModel {
    let transaction: TransactionModel
}

extension TransactionItemViewModel: Identifiable {
    var id: Int {
        return transaction.id
    }
}
