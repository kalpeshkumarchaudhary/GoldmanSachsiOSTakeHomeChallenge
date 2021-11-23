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
        var transactionsFilteredByCategory: [TransactionItemViewModel] = []
        
        // Test filtering by .food
        transactionsFilteredByCategory = sut.filterTransactions(by: .other(.food))
        XCTAssertEqual(transactionsFilteredByCategory.count, 2)
        
        // Test filtering by .shopping
        transactionsFilteredByCategory = sut.filterTransactions(by: .other(.shopping))
        XCTAssertEqual(transactionsFilteredByCategory.count, 2)
        
        // Test filtering by .entertainment
        transactionsFilteredByCategory = sut.filterTransactions(by: .other(.entertainment))
        XCTAssertEqual(transactionsFilteredByCategory.count, 1)
    }
    
    func testFilterTransactionsByAllCategotyReturnsAllTransaction() {
        var transactionsFilteredByCategory: [TransactionItemViewModel] = []
        // Test filtering by .all
        transactionsFilteredByCategory = sut.filterTransactions(by: .all)
        XCTAssertEqual(transactionsFilteredByCategory.count, sut.transactions.count)
    }
    
    func testFilterTransactionsByCategoryReturnsEmptyForNoTransactionWithCategory() {
        var transactionsFilteredByCategory: [TransactionItemViewModel] = []
        // Test filtering by category for which no transactions exist
        transactionsFilteredByCategory = sut.filterTransactions(by: .other(.travel))
        XCTAssertTrue(transactionsFilteredByCategory.isEmpty)
    }

}
