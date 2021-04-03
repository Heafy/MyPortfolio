//
//  RotatedBadgeView.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 03/04/21.
//

import SwiftUI

struct RotatedBadgeView: View {
    
    @Binding var symbolColor: Color
    
    let angle: Angle
    
    var body: some View {
        BadgeView(symbolColor: $symbolColor)
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeView(symbolColor: .constant(.blue) ,angle: Angle(degrees: 5))
    }
}
