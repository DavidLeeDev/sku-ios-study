//
//  Modifier.swift
//  Brevis
//
//  Created by 이승준 on 11/15/25.
//

import Foundation

enum Modifier: String, CaseIterable {
    case control = "⌃"
    case option = "⌥"
    case shift = "⇧"
    case command = "⌘"
    case enter = "⏎" // "⌅" "⏎"
    case escape = "⎋"
    case globe = "🌐"
    
    var description: String {
        switch(self) {
        case .control:
            "ctrl"
        case .option:
            "alt"
        case .shift:
            "shift"
        case .command:
            "command"
        case .enter:
            "enter"
        case .escape:
            "escape"
        case .globe:
            "globe/fn"
        }
    }
}
