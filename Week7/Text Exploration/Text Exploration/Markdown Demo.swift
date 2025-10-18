//
//  Markdown Demo.swift
//  Text Exploration
//
//  Created by 이승준 on 10/18/25.
//

import SwiftUI

struct Markdown_Demo: View {
    let favorite = """
            ***My Farvorite Websites***
            ___My Farvorite Websites___
            
            Here are some of my favorite websites for learning and exploring:
            1. **[Figma](https://figma.com/)**: A collaborative interface design tool
            2. *[Laws of UX](https://lawsofux.com/)*: A collection of principles that describe how users interact with interfaces
            3. ***[Pexels](https://www.pexels.com/)***: A platform offering free stock photos, vidieos, and music
            """
    var body: some View {
        Text(LocalizedStringKey(favorite))
        .tint(.red)
        .foregroundStyle(.blue)
        .padding()
    }
}

#Preview {
    Markdown_Demo()
}
