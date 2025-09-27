//
//  ExploreViewLibrary.swift
//  Exploring Views
//
//  Created by 이승준 on 9/26/25.
//

import SwiftUI

struct ExploreViewLibrary: View {
    let text: [String] = ["Exploring View!", "Hello World"]
    @State var index: Int = 0
    @State private var bgColor =
        Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    @State private var date = Date()
    @State private var isEditing = false
    @State private var speed = 50.0
    var body: some View {
        ZStack {
            bgColor.ignoresSafeArea()
            Form{
                Section(header: Text("Notifications")) {
                    Text(text[index])
                        .font(.largeTitle)
                        .padding()
                    
                    Button("A button"){
                        index = (index + 1) % text.count
                    }
                }
                Section(header: Text("User Profiles")) {
                    ColorPicker("Title", selection: $bgColor)
                        
                    DatePicker(selection: $date, label: {Text("Date")})
                    
                    Slider(
                        value: $speed,
                        in: 0...100,
                        onEditingChanged: { editing in
                            isEditing = editing
                        }
                    )
                    Text("\(speed)")
                        .foregroundColor(isEditing ? .red : .blue)
                }
            }
        }
    }
}

#Preview {
    ExploreViewLibrary()
}
