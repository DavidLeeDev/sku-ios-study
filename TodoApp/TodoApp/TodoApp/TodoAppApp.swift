import SwiftUI

@main
struct TodoApp: App {
    @StateObject private var viewModel = TodoViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                TodoListView(viewModel: viewModel)
                    .tabItem { Label("To-Do", systemImage: "checkmark.circle") }
                
                SettingsView(viewModel: viewModel)
                    .tabItem { Label("Settings", systemImage: "gearshape") }
            }
            .tint(.blue)
        }
    }
}
