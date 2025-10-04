//
//  ImageExploreExample7.swift
//  Image Exploration
//
//  Created by 이승준 on 10/4/25.
//

import SwiftUI

struct ImageExploreExample7: View {
    @State private var scaleToFit = true
    let appleURL = "https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png"
    var body: some View {
        ImageFromURL(
            urlString: appleURL,
            width: .infinity,
            height: 300,
            contentMode: scaleToFit ? .fit : .fill,
            cornerRadius: 20
        )
        .shadow(radius: 30)
        .background(Color.red)
        .padding()
        .background(Color.blue)
        .onTapGesture {
            scaleToFit.toggle()
        }
    }
}

struct ImageFromURL: View {
    let urlString: String
    let width: CGFloat
    let height: CGFloat
    let contentMode: ContentMode
    let cornerRadius: CGFloat
    var body: some View {
        AsyncImage(url: URL(string: urlString)) {
            phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable()
                    .cornerRadius(cornerRadius)
                    .aspectRatio(contentMode: contentMode)
                    .frame(width: width, height: height)
            case .failure:
                Image(systemName: "photo").imageScale(.large)
            @unknown default:
                EmptyView()
            }
        }
    }
}

#Preview {
    ImageExploreExample7()
}
