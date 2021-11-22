//
//  CategoryFilterView.swift
//  TechChallenge
//
//  Created by Kalpesh Chaudhary on 11/22/21.
//

import SwiftUI

struct CategoryFilterView: View {
    
    @Binding var selectedFilter: CategoryFilterViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(CategoryFilterViewModel.allCases) { category in
                    Button {
                        selectedFilter = category
                    } label: {
                        Text(category.name)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 16.0)
                            .padding(.vertical, 8.0)
                            .background(category.color)
                            .cornerRadius(32)
                    }
                }
            }
            .padding()
        }
        .background(Color.accentColor.opacity(0.8))
    }
}

#if DEBUG
struct CategoryFilterView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryFilterView(selectedFilter: .constant(.all))
            .previewLayout(.sizeThatFits)
    }
}
#endif
