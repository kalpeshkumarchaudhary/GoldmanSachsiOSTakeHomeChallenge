//
//  TransactionsViewModelTests.swift
//  TechChallengeTests
//
//  Created by Kalpesh Chaudhary on 11/22/21.
//

import XCTest
@testable import TechChallenge

class TransactionsViewModelTests: XCTestCase {
    
    var sut: TransactionsViewModel!
    
    override func setUpWithError() throws {
        sut = TransactionsViewModel(transactions: [
            TransactionItemViewModel(transaction: TransactionModel(
                id: 1,
                name: "Movie Night",
                category: .entertainment,
                amount: 82.99,
                date: Date(string: "2021-03-05")!,
                accountName: "Online Savings",
                provider: .timeWarner
            ), isPinned: true),
            TransactionItemViewModel(transaction: TransactionModel(
                id: 2,
                name: "Jeans",
                category: .shopping,
                amount: 54.60,
                date: Date(string: "2021-04-25")!,
                accountName: "Checking Account",
                provider: .jCrew
            ), isPinned: true),
            TransactionItemViewModel(transaction: TransactionModel(
                id: 6,
                name: "Monthly Best Seller",
                category: .shopping,
                amount: 6.51,
                date: Date(string: "2021-04-22")!,
                accountName: "Checking Account",
                provider: .amazon
            ), isPinned: true),
            TransactionItemViewModel(transaction: TransactionModel(
                id: 3,
                name: "Salad Mix",
                category: .food,
                amount: 25.32,
                date: Date(string: "2021-04-15")!,
                accountName: "Credit Card",
                provider: .wendys
            ), isPinned: true),
            TransactionItemViewModel(transaction: TransactionModel(
                id: 4,
                name: "Lunch Special",
                category: .food,
                amount: 10.36,
                date: Date(string: "2021-04-12")!,
                accountName: "Credit Card",
                provider: .burgerKing
            ), isPinned: true)
        ])
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testFilterTransactionsByCategoty() {
        // When
        let transactionsFilteredByFood = sut.filterTransactions(by: .other(.food))
        // Then
        XCTAssertEqual(transactionsFilteredByFood.count, 2)
    }
    
    func testFilterTransactionsByAllCategotyReturnsAllTransaction() {
        
    }
    
    func testFilterTransactionsByCategoryReturnsEmptyForNoTransactionWithCategory() {
        
    }
    
    func testFormattedAmountByCategotyViewModelForAllPinnedTransactions() {
        
    }
    
    func testFormattedAmountByCategotyViewModelForPinnedUnPinnedTransactions() {
        
    }
    
    func testFormattedAmountByCategotyViewModelIsZeroForAllUnPinnedTransactions() {
        
    }
    
    func testFormattedAmountByCategotyForAllPinnedTransactions() {
        
    }
    
    func testFormattedAmountByCategotyForPinnedUnPinnedTransactions() {
        
    }
    
    func testFormattedAmountByCategotyIsZeroForAllUnPinnedTransactions() {
        
    }

}
