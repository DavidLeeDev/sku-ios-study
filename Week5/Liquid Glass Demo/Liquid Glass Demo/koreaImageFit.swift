//
//  koreaImageFit.swift
//  Liquid Glass Demo
//
//  Created by 이승준 on 10/3/25.
//

import SwiftUI

struct DogImageFit: View {
    var body: some View {
        Image(.korea)
                .resizable()
                .scaledToFit()
                .opacity(0.8)
                .ignoresSafeArea()
    }
}

struct DogImageFill: View {
    var body: some View {
        Image(.korea)
                .resizable()
                .scaledToFill()
                .opacity(0.8)
                .ignoresSafeArea()
    }
}
