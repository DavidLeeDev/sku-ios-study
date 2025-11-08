//
//  LeftAligned.swift
//  LeftCenterRightDemo
//
//  Created by 이승준 on 11/8/25.
//

import SwiftUI

struct LeftAligned: ViewModifier {
    func body(content: Content) -> some View{
        content
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

extension View {
    public func left() -> some View {
        self.modifier(LeftAligned())
    }
}
