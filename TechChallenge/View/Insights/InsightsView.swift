//
//  InsightsView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 29/7/21.
//

import SwiftUI

struct InsightsView: View {
    @ObservedObject var viewModel: TransactionsViewModel
    
    var body: some View {
        List {
//            RingView(transactions: transactions)
//                .scaledToFit()
            
            ForEach(viewModel.transactionCategories) { category in
                HStack {
                    Text(category.rawValue)
                        .font(.headline)
                        .foregroundColor(category.color)
                    Spacer()
                    // TODO: calculate cummulative expense for each category
                    Text("$0.0")
                        .bold()
                        .secondary()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Insights")
    }
}

#if DEBUG
struct InsightsView_Previews: PreviewProvider {
    static var previews: some View {
        InsightsView(viewModel: TransactionsViewModel.sampleViewModel)
            .previewLayout(.sizeThatFits)
    }
}
#endif
