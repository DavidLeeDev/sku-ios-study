import SwiftUI

struct TodoListView: View {
    @ObservedObject var viewModel: TodoViewModel
    
    @State private var searchText: String = ""

    @State private var selectedSegment: Segment = .오늘
    @State private var showingAdd: Bool = false
    
    @AppStorage("hideCompleted") private var hideCompleted = false
    @AppStorage("sortOrder") private var sortOrder = 0
    
    enum Segment: String, CaseIterable, Identifiable {
        case 오늘 = "오늘"
        case 예정 = "예정"
        case 완료됨 = "완료됨"
        var id: String { rawValue }
    }
    
    private var filteredTodos: [TodoItem] {
        let filtered = viewModel.todos.filter { todo in
            let segmentFilter: Bool
            switch selectedSegment {
            case .오늘: // ✅ 한글 세그먼트 사용
                segmentFilter = todo.isToday && !(todo.isCompleted && hideCompleted)
            case .예정: // ✅ 한글 세그먼트 사용
                segmentFilter = todo.isUpcoming && !(todo.isCompleted && hideCompleted)
            case .완료됨: // ✅ 한글 세그먼트 사용
                segmentFilter = todo.isCompleted
            }

            guard segmentFilter else { return false }

            if searchText.isEmpty { return true }
            let lower = searchText.lowercased()
            let notesLower = (todo.notes).lowercased()
            return todo.title.lowercased().contains(lower) || notesLower.contains(lower)
        }

        return filtered.sorted { a, b in
            if a.isCompleted != b.isCompleted {
                return !a.isCompleted
            }

            switch sortOrder {
            case 0: // By Date (날짜순)
                if a.dueDate != b.dueDate {
                    return a.dueDate < b.dueDate
                }
                return a.title < b.title

            case 1: // By Priority (우선순위순)
                let p0 = TodoItem.Priority.allCases.firstIndex(of: a.priority) ?? 0
                let p1 = TodoItem.Priority.allCases.firstIndex(of: b.priority) ?? 0

                if p0 != p1 {
                    return p0 > p1
                }
                return a.dueDate < b.dueDate

            case 2: // By Title (이름순)
                return a.title < b.title

            default:
                return a.dueDate < b.dueDate
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                // Search bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.secondary)
        
                    TextField("검색", text: $searchText)
                        .textFieldStyle(.plain)
                }
                .padding(10)
                .background(.regularMaterial.opacity(0.6))
                .cornerRadius(10)
                .padding(.horizontal)
                
                // segmented tabs
                Picker("", selection: $selectedSegment) {
                    ForEach(Segment.allCases) { seg in
                        Text(seg.rawValue).tag(seg)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                // list
                List {
                    ForEach(filteredTodos) { todo in
                        TodoRowView(todo: todo, onToggle: {
                            viewModel.toggleComplete(todo)
                        })
                        .contentShape(Rectangle())
                        .onTapGesture {
                            // TODO: Implement edit functionality here
                        }
                    }
                    .onDelete(perform: viewModel.delete)
                }
                .listStyle(.insetGrouped)
                .overlay {
                    if filteredTodos.isEmpty && searchText.isEmpty {
                        ContentUnavailableView("할 일이 없습니다.", systemImage: "checklist")
                    } else if filteredTodos.isEmpty && !searchText.isEmpty {
                        ContentUnavailableView.search
                    }
                }
            }
            .navigationTitle("할 일 목록")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAdd = true }) {
                        Image(systemName: "plus")
                            .font(.title2)
                    }
                }
            }
            .sheet(isPresented: $showingAdd) {
                // AddTodoView는 이전 대화에서 정의된 뷰를 사용합니다.
                AddTodoView { new in
                    viewModel.add(new)
                    showingAdd = false
                }
            }
        }
    }
}

struct TodoRowView: View {
    let todo: TodoItem
    let onToggle: () -> Void
    
    var body: some View {
        HStack {
            Button(action: onToggle) {
                if todo.isCompleted {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.title2)
                        .foregroundColor(.blue)
                } else {
                    Image(systemName: "circle")
                        .font(.title2)
                        .foregroundColor(.secondary)
                }
            }
            .buttonStyle(.plain)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(todo.title)
                    .font(.body)
                    .strikethrough(todo.isCompleted, color: .gray)
                    .foregroundColor(todo.isCompleted ? .secondary : .primary)
                
                HStack {
                    Text(todo.dueDate, style: .date)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    if todo.priority != .none {
                        Text(todo.priority.rawValue)
                            .font(.caption2)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .foregroundColor(priorityTextColor(todo.priority))
                            .background(priorityBackgroundColor(todo.priority))
                            .cornerRadius(4)
                    }
                }
            }
            Spacer()
        }
        .padding(.vertical, 6)
    }

    private func priorityTextColor(_ p: TodoItem.Priority) -> Color {
        switch p {
        case .high: return .white
        case .low: return .primary
        case .none: return .secondary
        }
    }
    
    private func priorityBackgroundColor(_ p: TodoItem.Priority) -> Color {
        switch p {
        case .high: return .red
        case .low: return .blue.opacity(0.2)
        case .none: return Color(uiColor: .systemGray5)
        }
    }
}

extension TodoViewModel {
    static var mock: TodoViewModel {
        let vm = TodoViewModel()
        vm.todos = [
            TodoItem(title: "오늘 할 일 1 (높음)", notes: "매우 중요한 작업입니다.", dueDate: Date(), isCompleted: false, priority: .high),
            TodoItem(title: "오늘 할 일 2 (완료)", notes: "이것은 어제 완료되었습니다.", dueDate: Date(), isCompleted: true, priority: .low),
            TodoItem(title: "내일 발표 준비 (낮음)", notes: "자료 수집 및 슬라이드 제작", dueDate: Calendar.current.date(byAdding: .day, value: 1, to: Date())!, isCompleted: false, priority: .low),
            TodoItem(title: "다음 주 회의 준비", notes: "안건 정리하기", dueDate: Calendar.current.date(byAdding: .day, value: 7, to: Date())!, isCompleted: false, priority: .none),
            TodoItem(title: "오래된 완료 항목", notes: "", dueDate: Calendar.current.date(byAdding: .day, value: -5, to: Date())!, isCompleted: true, priority: .none)
        ]
        return vm
    }
}

#Preview("Todo List View") {
    // ViewModel에 Mock 데이터를 넣어 미리보기
    TodoListView(viewModel: TodoViewModel.mock)
}

