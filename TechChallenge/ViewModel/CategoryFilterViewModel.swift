//
//  CategoryFilterViewModel.swift
//  TechChallenge
//
//  Created by Kalpesh Chaudhary on 11/22/21.
//

import Foundation
import SwiftUI

enum CategoryFilterViewModel {
    case all
    case other(TransactionModel.Category)
}
