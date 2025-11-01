//
//  ContentView.swift
//  Rich Text Editor
//
//  Created by 이승준 on 10/31/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.fontResolutionContext) var fontResolutionContext
    @State private var text = AttributedString("Hello World!")
    @State private var selection = AttributedTextSelection()
    
    let foregroundColors: [Color] = [.red, .blue, .yellow,]
    let backgroundColors: [Color] = [.red, .blue, .yellow,]
    var body: some View {
        VStack {
            TextEditor(text: $text, selection: $selection)
                .overlay{
                    RoundedRectangle(cornerRadius: 12).stroke(Color.secondary.opacity(0.3))
                }
            VStack(spacing: 16){
                //Underline, Strikethrough, Baseline
                HStack{
                    Button("", systemImage: "underline"){
                        text.transformAttributes(
                            in: &selection
                        ){ container in
                            let current = container.underlineStyle
                            
                            container.underlineStyle = current == .single ? nil : .single
                        }
                    }.buttonStyle(.glassProminent)
                        .tint(.red)
                    Button("", systemImage: "strikethrough"){
                        text.transformAttributes(
                            in: &selection
                        ){ container in
                            let current = container.strikethroughStyle
                            
                            container.strikethroughStyle = current == .single ? nil : .single
                        }
                    }.buttonStyle(.glassProminent)
                        .tint(.red)
                    
                    Button("", systemImage: "arrow.up"){
                        text.transformAttributes(
                            in: &selection
                        ){ container in
                            let baseLine = container.baselineOffset
                            
                            container.baselineOffset = (baseLine ?? 0 ) + 2
                        }
                    }.buttonStyle(.glassProminent)
                        .tint(.red)
                    Button("", systemImage: "arrow.down"){
                        text.transformAttributes(
                            in: &selection
                        ){ container in
                            let baseLine = container.baselineOffset
                            
                            container.baselineOffset = (baseLine ?? 0 ) - 2
                        }
                    }.buttonStyle(.glassProminent)
                        .tint(.red)
                }
                
                //Color Picker - Foreground and Background
                HStack {
                    VStack(alignment: .leading){
                        ColorPickerRow(
                            title: "Text Color",
                            colors: foregroundColors
                        ){
                            color in
                            text.transformAttributes(in: &selection){
                                container in
                                container.foregroundColor = color
                            }
                        }
                        ColorPickerRow(
                            title: "Background Color",
                            colors: backgroundColors
                        ){
                            color in
                            text.transformAttributes(in: &selection){
                                container in
                                container.backgroundColor = color
                            }
                        }
                    }
                    Spacer()
                    
                    //Bold and Italic
                    VStack(alignment: .leading){
                        Button("Bold", systemImage: "bold") {
                            text
                                .transformAttributes(in: &selection){
                                    container in
                                    let current = container.font ?? .default
                                    let resolved = current.resolve(in: fontResolutionContext)
                                    let isBold = resolved.isBold
                                    
                                    container.font = current.bold(!isBold)
                                }
                        }
                        Button("Italic", systemImage: "italic") {
                            text
                                .transformAttributes(in: &selection){
                                    container in
                                    let current = container.font ?? .default
                                    let resolved = current.resolve(in: fontResolutionContext)
                                    let isItalic = resolved.isItalic
                                    
                                    container.font = current.bold(!isItalic)
                                }
                        }
                    }
                }
                
                //Text Alignment
                HStack{
                    Button("", systemImage: "text.alignleft"){
                        text.transformAttributes(
                            in: &selection
                        ){
                            container in container
                                .alignment = .left
                        }
                    }
                    Button("", systemImage: "text.aligncenter"){
                        text.transformAttributes(
                            in: &selection
                        ){
                            container in container
                                .alignment = .center
                        }
                    }
                    Button("", systemImage: "text.alignright"){
                        text.transformAttributes(
                            in: &selection
                        ){
                            container in container
                                .alignment = .right
                        }
                    }
                }
                
                //Selectiong Fonts
                HStack{
                    let fonts: [Font] = [
                        .largeTitle,
                        .title,
                        .body,
                        .headline,
                        .subheadline,
                        .caption,
                    ]
                    ForEach(fonts, id: \.self) { font in
                        Button("Aa"){
                            text.transformAttributes(
                                in: &selection
                            ){
                                container in container
                                    .font = font
                            }
                        }
                        .font(font)
                    }
                }

            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
