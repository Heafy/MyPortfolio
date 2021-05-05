//
//  RedactedCustomModifier.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 29/04/21.
//

import SwiftUI

struct RedactedCustomModifier: ViewModifier {

    @State private var condition: Bool = false
    func body(content: Content) -> some View {
        content
            .accessibility(label: Text("Placeholder"))
            .redacted(reason: .placeholder)
            .opacity(condition ? 0.0 : 1.0)
            .animation(Animation
                        .easeInOut(duration: 1)
                        .repeatForever(autoreverses: true))
            .onAppear { condition = true }
    }
}

extension View {
    
    @ViewBuilder
    func redactedLoading(when condition: Bool) -> some View {
        if !condition {
            unredacted()
        } else {
            self.modifier(RedactedCustomModifier())
        }
    }
}
