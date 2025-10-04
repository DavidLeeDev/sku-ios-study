import SwiftUI

// MARK: - 메인 뷰 (하단 탭)

struct MainView: View {
    
    // View가 초기화될 때 하단 탭 바의 모양을 설정합니다.
    init() {
        let appearance = UITabBarAppearance()
        
        // 1. 배경을 투명하게 만들어 뒤의 콘텐츠가 비치도록 준비합니다.
        appearance.configureWithTransparentBackground()
        
        // 2. 블러 효과(Glassmorphism)를 배경에 적용합니다.
        appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        
        // 3. 스크롤 상태와 상관없이 항상 이 스타일이 적용되도록 설정합니다.
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView {
            // --- 기존 코드와 동일 ---
            Text("홈 화면")
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("홈")
                }

            // 게시판 탭
            BoardView()
                .tabItem {
                    Image(systemName: "list.bullet.rectangle.portrait.fill")
                    Text("게시판")
                }

            Text("설정 화면")
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("설정")
                }

            Text("내 정보 화면")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("내 정보")
                }
        }
    }
}

// MARK: - 게시판 뷰 (상단 탭)

struct BoardView: View {
    @State private var selectedTab: BoardTab = .free
    @State private var showMorePopup = false

    enum BoardTab: String, CaseIterable {
        case free = "자유"
        case question = "질문"
        case info = "정보"
        case humor = "유머"
    }
    
    let moreTabs = ["팁", "스터디", "홍보", "뉴스", "자료실"]
    @State private var selectedMoreTab: String? = nil

    var body: some View {
        NavigationView {
            // VStack 전체에 배경색을 주어 스크롤 시 유리 효과가 더 잘 보이게 합니다.
            ZStack {
                // 배경색을 지정하여 Glass 효과가 더 잘 보이게 함
                Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    // 1. 상단 커스텀 탭 바
                    HStack {
                        // 기본 탭 4개
                        ForEach(BoardTab.allCases, id: \.self) { tab in
                            Button(action: {
                                self.selectedTab = tab
                                self.selectedMoreTab = nil // 기본 탭 선택 시 'More' 선택 해제
                            }) {
                                Text(tab.rawValue)
                                    .font(.headline)
                                    .foregroundColor(selectedTab == tab && selectedMoreTab == nil ? .blue : .gray)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 12)
                            }
                        }
                        
                        // "More" 버튼
                        Button(action: { showMorePopup.toggle() }) {
                            Image(systemName: "ellipsis")
                                .font(.headline)
                                // 'More' 탭이 선택되었을 때 파란색으로 표시
                                .foregroundColor(selectedMoreTab != nil ? .blue : .gray)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                        }
                        .popover(isPresented: $showMorePopup, arrowEdge: .top) {
                            MoreTabsPopoverView(moreTabs: moreTabs, selectedMoreTab: $selectedMoreTab, showMorePopup: $showMorePopup)
                        }
                    }
                    // --- ✨ Liquid Glass 효과 적용 부분 ---
                    .padding(.horizontal, 8)
                    .background(.ultraThinMaterial) // 핵심: 반투명한 블러 효과
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, y: 2)
                    .padding(.horizontal)
                    .padding(.top, 10)
                    // --- ✨ ---

                    // 2. 선택된 탭에 따른 콘텐츠 표시 영역
                    ZStack {
                        if let moreTab = selectedMoreTab {
                            BoardContentView(title: moreTab)
                        } else {
                            switch selectedTab {
                            case .free: BoardContentView(title: "자유")
                            case .question: BoardContentView(title: "질문")
                            case .info: BoardContentView(title: "정보")
                            case .humor: BoardContentView(title: "유머")
                            }
                        }
                    }
                    // 콘텐츠 뷰가 상단 바 아래부터 시작되도록
                    .padding(.top, 10)
                }
                .navigationTitle("게시판")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

// MARK: - 'More' 팝업 뷰 (가독성을 위해 분리)

struct MoreTabsPopoverView: View {
    let moreTabs: [String]
    @Binding var selectedMoreTab: String?
    @Binding var showMorePopup: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(moreTabs, id: \.self) { tabName in
                Button(action: {
                    self.selectedMoreTab = tabName
                    self.showMorePopup = false
                }) {
                    Text(tabName)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }
                .contentShape(Rectangle()) // 버튼 영역 전체를 터치 가능하게
                
                if tabName != moreTabs.last {
                    Divider()
                }
            }
        }
        .foregroundColor(.primary)
    }
}

// MARK: - 게시판 콘텐츠 뷰

struct BoardContentView: View {
    let title: String
    var body: some View {
        List {
            ForEach(1...20, id: \.self) { i in
                Text("\(title) 게시판 글 \(i)")
            }
        }
        // 리스트 배경을 투명하게 만들어 ZStack의 배경색이 보이도록 함
        .scrollContentBackground(.hidden)
    }
}
#Preview{MainView()}
