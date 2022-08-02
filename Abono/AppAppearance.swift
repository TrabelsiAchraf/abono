//
//  AppAppearance.swift
//  Abono
//
//  Created by Achraf Trabelsi on 02/08/2022.
//

import SwiftUI

enum Appearance: String {
    case system, light, dark
    var value: ColorScheme? {
        switch self {
        case .system:
            return nil
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
    var text: String {
        switch self {
        case .system:
            return "Automatic"
        case .light:
            return "Light"
        case .dark:
            return "Dark"
        }
    }
}
