//
//  ImageExploreExample6.swift
//  Image Exploration
//
//  Created by 이승준 on 10/4/25.
//

import SwiftUI

struct ImageExploreExample6: View {
    let appleURL = "https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png"
    var body: some View {
        AsyncImage(url: URL(string: appleURL)) {
            phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 300)
            case .failure:
                Image(systemName: "photo").imageScale(.large)
            @unknown default:
                EmptyView()
            }
        }
    }
}

#Preview {
    ImageExploreExample6()
}
