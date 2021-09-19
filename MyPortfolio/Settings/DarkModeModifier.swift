//
//  DarkModeModifier.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 19/09/21.
//

import SwiftUI

struct DarkModeModifier: ViewModifier {
    
    private var darkMode: String?
    
    init() {
        //print("Aqui se inicializa el modifier")
        self.darkMode = UserDefaults.standard.string(forKey: "darkMode")
    }
    
    func body(content: Content) -> some View {
        if let darkMode = darkMode {
            if darkMode == "Light" {
                content
                    .environment(\.colorScheme, .light)
            } else if darkMode == "Dark" {
                content.environment(\.colorScheme, .dark)
            } else {
                content
            }
        } else {
            content
        }
    }
}

extension View {
    
    @ViewBuilder
    func supportDarkMode() -> some View {
        self.modifier(DarkModeModifier())
    }
}
