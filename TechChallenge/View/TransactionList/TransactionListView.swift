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
            List {
                ForEach(viewModel.filterTransactions(by: selectedFilter)) { transaction in
                    if let index = viewModel.transactions.firstIndex(where: { $0 == transaction }) {
                        TransactionView(viewModel: $viewModel.transactions[index])
                    }
                }
            }
            .animation(.easeIn)
            .listStyle(PlainListStyle())
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Transactions")
        }
    }
}

#if DEBUG
struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView(viewModel: TransactionsViewModel.sampleViewModel)
    }
}
#endif
