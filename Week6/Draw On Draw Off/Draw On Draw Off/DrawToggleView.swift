//
//  DrawToggleView.swift
//  Draw On Draw Off
//
//  Created by 이승준 on 10/10/25.
//

import SwiftUI


struct DrawOnToggleView: View {
    let title: String
    let effect: DrawOnSymbolEffect
    let systemName: String
    let speed: Double
    
    @State private var isActive = true
    
    init(
        title: String,
        effect: DrawOnSymbolEffect,
        systemName: String = "signature",
        speed: Double,
    ) {
        self.title = title
        self.effect = effect
        self.systemName = systemName
        self.speed = speed
    }
    
    var body: some View {
        VStack {
            Text(title).font(.headline).bold()
            
            HStack {
                Image(systemName: systemName)
                    .foregroundStyle(.secondary.opacity(0.3))
                    .frame(maxWidth: .infinity)
                
                
                Image(systemName: systemName)
                    .symbolEffect(
                        effect,
                        options: .speed(speed),
                        isActive: isActive
                    )
                    .frame(maxWidth: .infinity)
            }
        }
        .font(.largeTitle)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15).stroke()
        )
        .onTapGesture {
            isActive.toggle()
        }
    }
}
struct DrawOffToggleView: View {
    let title: String
    let effect: DrawOffSymbolEffect
    let systemName: String
    let speed: Double
    
    @State private var isActive = true
    
    init(
        title: String,
        effect: DrawOffSymbolEffect,
        systemName: String = "signature",
        speed: Double,
    ) {
        self.title = title
        self.effect = effect
        self.systemName = systemName
        self.speed = speed
    }
    
    var body: some View {
        VStack {
            Text(title).font(.headline).bold()
            
            HStack {
                Image(systemName: systemName)
                    .foregroundStyle(.secondary.opacity(0.3))
                    .frame(maxWidth: .infinity)
                
                
                Image(systemName: systemName)
                    .symbolEffect(
                        effect,
                        options: .speed(speed),
                        isActive: isActive
                    )
                    .frame(maxWidth: .infinity)
            }
        }
        .font(.largeTitle)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15).stroke()
        )
        .onTapGesture {
            isActive.toggle()
        }
    }
}
#Preview {
    VStack {
        DrawOnToggleView(title: "Draw On", effect: .drawOn.byLayer, speed: 5)
        DrawOffToggleView(title: "Draw Off", effect: .drawOff, speed: 5)
    }
}
