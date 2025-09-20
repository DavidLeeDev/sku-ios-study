//
//  DataItemModel.swift
//  Greetings
//
//  Created by 이승준 on 9/20/25.
//

import Foundation
import SwiftUI

struct DataItemModel: Identifiable {
    let id = UUID()
    let text: LocalizedStringKey
    let color: Color
}
