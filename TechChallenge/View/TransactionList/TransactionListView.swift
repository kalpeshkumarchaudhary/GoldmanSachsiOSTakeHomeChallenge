//
//  TransactionListView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct TransactionListView: View {
    @State private var selectedFilter: CategoryFilterViewModel = .all
    @ObservedObject var viewModel: TransactionsViewModel
    
    var body: some View {
        VStack {
            CategoryFilterView(selectedFilter: $selectedFilter)
            
            transactionListView
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Transactions")
            
            amountByCategoryView
        }
    }
    
    private var transactionListView: some View {
        List {
            ForEach(viewModel.filterTransactions(by: selectedFilter)) { transaction in
                if let index = viewModel.transactions.firstIndex(where: { $0 == transaction }) {
                    TransactionView(viewModel: $viewModel.transactions[index])
                }
            }
        }
        .animation(.easeIn)
        .listStyle(PlainListStyle())
    }
    
    private var amountByCategoryView: some View {
        VStack {
            HStack {
                Spacer()
                Text(selectedFilter.name)
                    .foregroundColor(selectedFilter.color)
                    .font(.headline)
            }
            
            HStack {
                Text("Total spent:")
                    .fontWeight(.regular)
                    .secondary()
                Spacer()
                Text("$\(viewModel.formattedAmount(by: selectedFilter))")
                    .fontWeight(.bold)
                    .secondary()
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8.0)
                .stroke(Color.black, lineWidth: 2.0)
        )
        .padding(.vertical, 4.0)
        .padding(.horizontal, 8.0)
    }
}

#if DEBUG
struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView(viewModel: TransactionsViewModel.sampleViewModel)
    }
}
#endif
