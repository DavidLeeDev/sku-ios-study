//
//  Displaying Code With Markdown.swift
//  Text Exploration
//
//  Created by 이승준 on 10/18/25.
//

import SwiftUI

struct Displaying_Code_With_Markdown: View {
    let codeString = """
        `import SwiftUI`
        
        `struct Displaying_Code_With_Markdown: View {`
            
            `var body: some View {`
                
            `}`
        `}`

        `#Preview {`
            `Displaying_Code_With_Markdown()``
        `}`
        
        """
    var body: some View {
        Text(LocalizedStringKey(codeString)).padding()
    }
}

#Preview {
    Displaying_Code_With_Markdown()
}
