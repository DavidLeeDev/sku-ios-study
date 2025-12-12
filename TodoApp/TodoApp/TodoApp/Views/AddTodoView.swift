import SwiftUI

struct AddTodoView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var notes: String = ""
    @State private var dueDate: Date = Date()
    @State private var priority: TodoItem.Priority = .none
    
    var onSave: (TodoItem) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                Section("할 일") {
                    TextField("제목", text: $title)
                    
                    ZStack(alignment: .topLeading) {
                        if notes.isEmpty {
                            Text("메모 (선택 사항)")
                                .foregroundColor(Color(UIColor.placeholderText))
                                .padding(.top, 8)
                                .padding(.leading, 5)
                        }
                        
                        TextEditor(text: $notes)
                            .frame(minHeight: 100)
                    }
                }

                Section("설정") {
                    DatePicker(selection: $dueDate, displayedComponents: [.date, .hourAndMinute]) {
                        Label("기한", systemImage: "calendar")
                    }
                    Picker(selection: $priority) {

                        ForEach(TodoItem.Priority.allCases, id: \.self) { p in
                            Text(p.rawValue).tag(p)
                        }
                    } label: {
                        Label("중요도", systemImage: "flag")
                    }
                    .pickerStyle(.menu)
                }
            }
            .navigationTitle("할 일 추가")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("취소") { dismiss() }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("완료") {
                        let trimmed = title.trimmingCharacters(in: .whitespacesAndNewlines)
                        guard !trimmed.isEmpty else { return }
                    
                        let todo = TodoItem(title: trimmed, notes: notes.isEmpty ? "" : notes, dueDate: dueDate, isCompleted: false, priority: priority)
                        
                        onSave(todo)
                        dismiss()
                    }
                    .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
        }
    }
}
#Preview {
    AddTodoView(onSave: { item in
        print("미리보기에서 저장됨: \(item.title), 중요도: \(item.priority.rawValue)")
    })
}
