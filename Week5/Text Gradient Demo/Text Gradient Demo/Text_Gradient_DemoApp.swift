//
//  Text_Gradient_DemoApp.swift
//  Text Gradient Demo
//
//  Created by 이승준 on 10/4/25.
//

import SwiftUI

@main
struct Text_Gradient_DemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(colorList: [.yellow, .black.opacity(0.85), .orange])
        }
    }
}
