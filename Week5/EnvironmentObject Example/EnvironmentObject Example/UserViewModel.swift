//
//  UserViewModel.swift
//  EnvironmentObject Example
//
//  Created by 이승준 on 10/3/25.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published var name: String = "David"
}
