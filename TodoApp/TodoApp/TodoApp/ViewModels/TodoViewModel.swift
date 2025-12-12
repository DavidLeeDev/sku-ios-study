import Foundation
import Combine
import SwiftUI

final class TodoViewModel: ObservableObject {
    @Published var todos: [TodoItem] = [] {
        didSet { saveTodos() }
    }
    
    private let saveKey = "SavedTodos_v1"
    
    init() {
        loadTodos()
    }
    
    func add(_ todo: TodoItem) {
        todos.append(todo)
    }
    
    func update(_ todo: TodoItem) {
        guard let idx = todos.firstIndex(where: { $0.id == todo.id }) else { return }
        todos[idx] = todo
    }
    
    func delete(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
    
    func toggleComplete(_ todo: TodoItem) {
        guard let idx = todos.firstIndex(where: { $0.id == todo.id }) else { return }
        todos[idx].isCompleted.toggle()
        // published property will trigger save
    }
    
    private func saveTodos() {
        do {
            let data = try JSONEncoder().encode(todos)
            UserDefaults.standard.set(data, forKey: saveKey)
        } catch {
            print("Failed to encode todos:", error)
        }
    }
    
    private func loadTodos() {
        guard let data = UserDefaults.standard.data(forKey: saveKey) else { return }
        do {
            let decoded = try JSONDecoder().decode([TodoItem].self, from: data)
            todos = decoded
        } catch {
            print("Failed to decode todos:", error)
        }
    }
}
