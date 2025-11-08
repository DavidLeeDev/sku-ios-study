
//
//  ContentView.swift
//  Toast Modifier
//
//  Created by 이승준 on 11/8/25.
//

import SwiftUI

struct ToastDemo: View {
    @State private var showToast = true
    var showToastPrompt: String {
        showToast ? "Hide Toast" : "Show Toast"
    }
    let text: String
    var body: some View {
        Button{
            withAnimation(.spring){
                showToast.toggle()
            }
        } label: {
            Text(showToastPrompt)
        }
        .toast(text: text, showToast: $showToast)
    }
}





#Preview {
    ToastDemo(text: "Toast is delicious")
}
