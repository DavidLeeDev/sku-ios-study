//
//  ExploringGlassEffect.swift
//  Liquid Glass Demo
//
//  Created by 이승준 on 10/3/25.
//

import SwiftUI

struct ExploringGlassEffect: View {
    @State private var tapped = false
    @State private var spacing = 20.0
    var body: some View {
        ZStack {
            DogImageFit()
            
            VStack {
                Text("Tap Me!")
                    .font(.title)
                    .padding()
                    .glassEffect(
                        .regular.tint(.red.opacity(0.3)),
                        in: tapped ? .rect(
                            topLeadingRadius: 20,
                            bottomLeadingRadius: 20,
                            bottomTrailingRadius: 20,
                            topTrailingRadius: 20,
                        ) : .rect(
                            topLeadingRadius: 20,
                            bottomLeadingRadius: 0,
                            bottomTrailingRadius: 20,
                            topTrailingRadius: 0,)
                    )
                    .onTapGesture {
                        withAnimation {
                            tapped.toggle()
                        }
                    }
                
                Image(systemName: "pawprint")
                    .font(.title)
                    .padding()
                    .glassEffect(.regular.tint(.red), in: .circle)
                GlassEffectContainer{
                    HStack(spacing: spacing) {
                        Image(systemName: "pawprint")
                            .font(.title)
                            .padding()
                            .glassEffect(.regular.interactive(false), in: .circle)
                        Image(systemName: "pawprint")
                            .font(.title)
                            .padding()
                            .glassEffect(.regular.interactive(true).tint(.mint), in: .circle)
                        
                        Image(systemName: "pawprint")
                            .font(.title)
                            .padding()
                            .glassEffect(.regular.interactive(false).tint(.indigo), in: .circle)
                        Image(systemName: "pawprint")
                            .font(.title)
                            .padding()
                            .glassEffect(.regular.interactive(true).tint(.brown), in: .circle)
                        
                    }
                }
                GlassEffectContainer{
                    ZStack {
                        Image(systemName: "pawprint")
                            .font(.title)
                            .padding()
                            .glassEffect(.regular.interactive(false).tint(.green), in: .circle)
                            .offset(x: -spacing * 5)
                        Image(systemName: "pawprint")
                            .font(.title)
                            .padding()
                            .glassEffect(.regular.interactive(true).tint(.mint), in: .circle)
                            .offset(x: -spacing * 10, y: -spacing * 2)
                        
                        Image(systemName: "pawprint")
                            .font(.title)
                            .padding()
                            .glassEffect(.regular.interactive(false).tint(.indigo), in: .circle)
                            .offset(x: spacing * 5)
                        Image(systemName: "pawprint")
                            .font(.title)
                            .padding()
                            .glassEffect(.regular.interactive(true).tint(.brown), in: .circle)
                            .offset(x: spacing * 10)
                        
                    }
                }
                Slider(value: $spacing, in: 0 ... 50)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ExploringGlassEffect()
}
