//
//  Environment_ExampleApp.swift
//  Environment Example
//
//  Created by 이승준 on 10/3/25.
//

import SwiftUI

@main
struct Environment_ExampleApp: App {
    @State private var personViewModel = PersonViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(personViewModel)
        }
    }
}
