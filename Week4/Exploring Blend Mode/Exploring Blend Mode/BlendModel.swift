//
//  BlendModel.swift
//  Exploring Blend Mode
//
//  Created by 이승준 on 9/27/25.
//

import SwiftUI

struct BlendModel: Identifiable {
    let id = UUID()
    
    let blendMode: BlendMode
    let title: String
    let describe: String
}
