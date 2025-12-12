import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: TodoViewModel
    @AppStorage("hideCompleted") private var hideCompleted = false
    @AppStorage("sortOrder") private var sortOrder = 0
    
    var body: some View {
        NavigationStack {
            Form {
          
                Section("표시") {
                    Toggle(isOn: $hideCompleted) {
                        Label("완료된 항목 가리기", systemImage: "eye.slash")
                    }
                }
               
                Section("정렬") {
                    Picker(selection: $sortOrder) {
                        Text("날짜 순").tag(0)
                        Text("중요도 순").tag(1)
                        Text("제목 순").tag(2)
                    } label: {
                        Label("기본 정렬 순서", systemImage: "arrow.up.arrow.down")
                    }
                    .pickerStyle(.menu)
                }
            }
            .navigationTitle("설정")
        }
    }
}
