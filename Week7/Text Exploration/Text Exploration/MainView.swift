//
//  MainView.swift
//  Text Exploration
//
//  Created by 이승준 on 10/18/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack{
            List{
                NavigationLink("Acrostic Poems"){
                    AcrosticPoemView()
                }
                NavigationLink("Markdown"){
                    Markdown_Demo()
                }
            }.navigationTitle("Style and Text View")
        }
    }
}

#Preview {
    MainView()
}
