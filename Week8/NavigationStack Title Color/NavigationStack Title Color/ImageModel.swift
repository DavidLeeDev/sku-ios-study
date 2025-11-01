//
//  ImageModel.swift
//  NavigationStack Title Color
//
//  Created by 이승준 on 11/1/25.
//

import Foundation
import SwiftUI

struct ImageModel: Identifiable {
    let id = UUID()
    let name: String
    let color: Color
    let zIndex: Double
    
    init(name: String, color: Color, zIndex: Double) {
        self.name = name
        self.color = color
        self.zIndex = zIndex
    }
    init(name: String, color: Color) {
        self.name = name
        self.color = color
        self.zIndex = 0
    }
    init(name: String) {
        let colors: [Color] = [
            .red,
            .pink,
            .cyan,
            .orange,
            .purple,
            .yellow
        ]
        self.name = name
        self.color = colors.randomElement() ?? .red
        self.zIndex = 0
    }
}
