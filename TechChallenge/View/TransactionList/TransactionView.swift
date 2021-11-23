//
//  TransactionView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct TransactionView: View {
    @Binding var viewModel: TransactionItemViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.categoryName)
                    .font(.headline)
                    .foregroundColor(viewModel.categoryColor)
                Spacer()
                Image(systemName: viewModel.isPinned ? "pin.fill" : "pin.slash.fill")
            }
            .contentShape(Rectangle())
            .onTapGesture {
                viewModel.toggleIsPinned()
            }
            
            if viewModel.isPinned {
                HStack {
                    viewModel.transactionImage
                        .resizable()
                        .frame(
                            width: 60.0,
                            height: 60.0,
                            alignment: .top
                        )
                    
                    VStack(alignment: .leading) {
                        Text(viewModel.transactionName)
                            .secondary()
                        Text(viewModel.accountName)
                            .tertiary()
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("$\(viewModel.transactionAmount)")
                            .bold()
                            .secondary()
                        Text(viewModel.transactionDate)
                            .tertiary()
                    }
                }
            }
        }
        .padding(8.0)
        .background(Color.accentColor.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 8.0))
    }
}

#if DEBUG
struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TransactionView(viewModel: .constant(TransactionItemViewModel(transaction: ModelData.sampleTransactions[0])))
            TransactionView(viewModel: .constant(TransactionItemViewModel(transaction: ModelData.sampleTransactions[1])))
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
#endif
