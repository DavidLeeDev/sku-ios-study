//
//  ToolTipView.swift
//  ToolTipView
//
//  Created by 이승준 on 11/1/25.
//

import SwiftUI

struct ToolTipView<Content: View, Message: View>: View {
    @State var showToolTip: Bool = false
    @GestureState var press = false
    
    let content: Content
    let message: Message
    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 0.5)
            .updating($press){
                currentState, gestureState, transaction in
                gestureState = currentState
            }
            .onEnded{ finished in
                showToolTip.toggle()
            }
    }
    
    init(@ViewBuilder content: @escaping() -> Content, @ViewBuilder message: @escaping () -> Message) {
        self.content = content()
        self.message = message()
    }
    
    var body: some View {
        ZStack {
            content.gesture(longPress)
            message
                .opacity(press ? 1.0 : 0.0)
                .animation(
                    .spring(response: 0.4, dampingFraction: 0.6),
                    value: press
                )
        }
    }
}

#Preview {
    ToolTipView(content: {
        MyImageView()
    }, message: {
        MessageView(text: "Image of lightening")
    })
}
