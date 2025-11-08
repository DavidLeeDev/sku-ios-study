//
//  ToastView.swift
//  Toast Modifier
//
//  Created by 이승준 on 11/8/25.
//
import SwiftUI

struct ToastView: View {
    let text: String
    @Binding var showToast: Bool
    var body: some View {
        TextWithBackgroundView(text: text)
            .offset(y: showToast ? 0 : 100)
            .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

struct ToastModifier: ViewModifier {
    let text: String
    @Binding var showToast: Bool
    
    func body(content: Content)->some View {
        ZStack {
            content
            
            TextWithBackgroundView(text: text)
                .offset(y: showToast ? 0 : 100)
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

extension View {
    func toast(text: String, showToast: Binding<Bool>)->some View {
        self
            .modifier(ToastModifier(text: text, showToast: showToast))
    }
}


#Preview {
    ToastView(
        text: "Hello Toast",
        showToast: .constant(true)
    )
}
