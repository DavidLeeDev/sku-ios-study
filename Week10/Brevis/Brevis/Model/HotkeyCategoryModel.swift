//
//  HotkeyCategoryModel.swift
//  Brevis
//
//  Created by 이승준 on 11/15/25.
//

import Foundation

struct HotkeyCategoryModel: Identifiable {
    let id = UUID()
    
    var name: String
    var hotkeyModels: [HotkeyModel]
    
}
