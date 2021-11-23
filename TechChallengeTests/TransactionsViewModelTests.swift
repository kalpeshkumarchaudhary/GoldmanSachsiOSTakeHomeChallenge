//
//  TransactionsViewModelTests.swift
//  TechChallengeTests
//
//  Created by Kalpesh Chaudhary on 11/22/21.
//

import XCTest
@testable import TechChallenge

class TransactionsViewModelTests: XCTestCase {
    
    func testFilterTransactionsByCategoty() {

        let sut = makeSut()
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
        let sut = makeSut()
        var transactionsFilteredByCategory: [TransactionItemViewModel] = []
        
        // Test filtering by .all
        transactionsFilteredByCategory = sut.filterTransactions(by: .all)
        XCTAssertEqual(transactionsFilteredByCategory.count, sut.transactions.count)
    }
    
    func testFilterTransactionsByCategoryReturnsEmptyForNoTransactionWithCategory() {
        let sut = makeSut()
        var transactionsFilteredByCategory: [TransactionItemViewModel] = []
        
        // Test filtering by category for which no transactions exist
        transactionsFilteredByCategory = sut.filterTransactions(by: .other(.travel))
        XCTAssertTrue(transactionsFilteredByCategory.isEmpty)
    }
    
    func testFormattedAmountByCategotyViewModelForAllPinnedTransactions() {
        let sut = makeSut()
        var formattedAmountByCategory: String = ""
        
        // Test formatted amount by .food
        formattedAmountByCategory = sut.formattedAmount(by: .other(.food))
        XCTAssertEqual(formattedAmountByCategory, "35.00")
        
        // Test formatted amount by .shopping
        formattedAmountByCategory = sut.formattedAmount(by: .other(.shopping))
        XCTAssertEqual(formattedAmountByCategory, "60.00")
        
        // Test formatted amount by .entertainment
        formattedAmountByCategory = sut.formattedAmount(by: .other(.entertainment))
        XCTAssertEqual(formattedAmountByCategory, "82.00")
        
        // Test formatted amount by .all
        formattedAmountByCategory = sut.formattedAmount(by: .all)
        XCTAssertEqual(formattedAmountByCategory, "177.00")
    }
    
    func testFormattedAmountByCategotyViewModelForPinnedUnPinnedTransactions() {
        
    }
    
    func testFormattedAmountByCategotyViewModelIsZeroForAllUnPinnedTransactions() {
        
    }
    
    func testFormattedAmountByCategotyViewModelReturnsZeroForNoTransactionWithCategory() {
        let sut = makeSut()
        var formattedAmountByCategory: String = ""
        
        // Test formatted amount by category for which no transactions exist
        formattedAmountByCategory = sut.formattedAmount(by: .other(.travel))
        XCTAssertEqual(formattedAmountByCategory, "0.00")
    }
}

extension TransactionsViewModelTests {
    private func makeSut() -> TransactionsViewModel {
        return TransactionsViewModel(transactions: [
            TransactionItemViewModel(transaction: TransactionModel(
                id: 1,
                name: "Movie Night",
                category: .entertainment,
                amount: 82.00,
                date: Date(string: "2021-03-05")!,
                accountName: "Online Savings",
                provider: .timeWarner
            ), isPinned: true),
            TransactionItemViewModel(transaction: TransactionModel(
                id: 2,
                name: "Jeans",
                category: .shopping,
                amount: 54.00,
                date: Date(string: "2021-04-25")!,
                accountName: "Checking Account",
                provider: .jCrew
            ), isPinned: true),
            TransactionItemViewModel(transaction: TransactionModel(
                id: 6,
                name: "Monthly Best Seller",
                category: .shopping,
                amount: 6.00,
                date: Date(string: "2021-04-22")!,
                accountName: "Checking Account",
                provider: .amazon
            ), isPinned: true),
            TransactionItemViewModel(transaction: TransactionModel(
                id: 3,
                name: "Salad Mix",
                category: .food,
                amount: 25.00,
                date: Date(string: "2021-04-15")!,
                accountName: "Credit Card",
                provider: .wendys
            ), isPinned: true),
            TransactionItemViewModel(transaction: TransactionModel(
                id: 4,
                name: "Lunch Special",
                category: .food,
                amount: 10.00,
                date: Date(string: "2021-04-12")!,
                accountName: "Credit Card",
                provider: .burgerKing
            ), isPinned: true)
        ])
    }
    
    private func makeSutWithPinnedAndUnPinnedTransactions() -> TransactionsViewModel {
        return TransactionsViewModel(transactions: [
            TransactionItemViewModel(transaction: TransactionModel(
                id: 2,
                name: "Jeans",
                category: .shopping,
                amount: 54.00,
                date: Date(string: "2021-04-25")!,
                accountName: "Checking Account",
                provider: .jCrew
            ), isPinned: true),
            TransactionItemViewModel(transaction: TransactionModel(
                id: 6,
                name: "Monthly Best Seller",
                category: .shopping,
                amount: 6.00,
                date: Date(string: "2021-04-22")!,
                accountName: "Checking Account",
                provider: .amazon
            ), isPinned: true),
            TransactionItemViewModel(transaction: TransactionModel(
                id: 3,
                name: "Salad Mix",
                category: .food,
                amount: 25.00,
                date: Date(string: "2021-04-15")!,
                accountName: "Credit Card",
                provider: .wendys
            ), isPinned: false),
            TransactionItemViewModel(transaction: TransactionModel(
                id: 4,
                name: "Lunch Special",
                category: .food,
                amount: 10.00,
                date: Date(string: "2021-04-12")!,
                accountName: "Credit Card",
                provider: .burgerKing
            ), isPinned: true)
        ])
    }
    
    private func makeSutWithAllUnPinnedTransactions() -> TransactionsViewModel {
        return TransactionsViewModel(transactions: [
            TransactionItemViewModel(transaction: TransactionModel(
                id: 1,
                name: "Movie Night",
                category: .entertainment,
                amount: 82.00,
                date: Date(string: "2021-03-05")!,
                accountName: "Online Savings",
                provider: .timeWarner
            ), isPinned: false),
            TransactionItemViewModel(transaction: TransactionModel(
                id: 2,
                name: "Jeans",
                category: .shopping,
                amount: 54.00,
                date: Date(string: "2021-04-25")!,
                accountName: "Checking Account",
                provider: .jCrew
            ), isPinned: false),
            TransactionItemViewModel(transaction: TransactionModel(
                id: 6,
                name: "Monthly Best Seller",
                category: .shopping,
                amount: 6.00,
                date: Date(string: "2021-04-22")!,
                accountName: "Checking Account",
                provider: .amazon
            ), isPinned: false)
        ])
    }
}
