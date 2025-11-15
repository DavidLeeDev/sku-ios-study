//
//  HotkeyModel.swift
//  Brevis
//
//  Created by 이승준 on 11/15/25.
//

import Foundation

struct HotkeyModel: Identifiable {
    let id = UUID()
    
    let modifiers: [Modifier]
    let character: String
    let text: String
    
    var description: String {
        var result = ""
        for modifier in modifiers {
            result += modifier.rawValue
        }
        
        result += " \(character.capitalized)"
        
        return result
    }
}
