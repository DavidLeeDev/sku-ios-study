//
//  iPadSupport.swift
//  Calculator
//
//  Created by 이승준 on 11/8/25.
//



import SwiftUI

extension UIDevice {
    static var isIPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var isIPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
}
