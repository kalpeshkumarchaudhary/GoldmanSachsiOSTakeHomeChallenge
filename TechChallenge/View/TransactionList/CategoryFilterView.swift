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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
