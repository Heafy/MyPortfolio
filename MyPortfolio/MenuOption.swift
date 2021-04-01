//
//  File.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 31/03/21.
//

import SwiftUI

struct MenuOption: Identifiable {
    
    let id = UUID()
    var name: String
    var systemImage: String
    var view: AnyView
    //var view: View
}
