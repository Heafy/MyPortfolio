//
//  RowView.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 31/03/21.
//

import SwiftUI

struct RowView: View {
    
    var option: MenuOption
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: option.systemImage)
            Text(option.name)
        }.padding()
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(option: MenuOption(name: "Placehoder name", systemImage: "hammer", view: AnyView(EmptyView()))).previewLayout(.sizeThatFits)
    }
}
