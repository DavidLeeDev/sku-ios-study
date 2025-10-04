//
//  ImageExploreExample5.swift
//  Image Exploration
//
//  Created by 이승준 on 10/4/25.
//

import SwiftUI

struct ImageExploreExample5: View {
    let appleURL = "https://www.google.com/imgres?q=image&imgurl=https%3A%2F%2Fplus.unsplash.com%2Fpremium_photo-1664474619075-644dd191935f%3Ffm%3Djpg%26q%3D60%26w%3D3000%26ixlib%3Drb-4.1.0%26ixid%3DM3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%253D&imgrefurl=https%3A%2F%2Funsplash.com%2Fko%2Fs%2F%25EC%2582%25AC%25EC%25A7%2584%2Fimage&docid=ekX6V7UFf69LuM&tbnid=2brKLR3s5kTpPM&vet=12ahUKEwiii9OZ5YmQAxW9d_UHHcfXM74QM3oECBYQAA..i&w=3000&h=2003&hcb=2&ved=2ahUKEwiii9OZ5YmQAxW9d_UHHcfXM74QM3oECBYQAA"
    var body: some View {
        AsyncImage(url: URL(string: appleURL))
    }
}

#Preview {
    ImageExploreExample5()
}
