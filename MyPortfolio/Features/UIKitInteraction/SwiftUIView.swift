//
//  SwiftUIView.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 05/05/21.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        Text("This is a view using SwiftUI")
            .navigationBarTitle("SwiftUI", displayMode: .inline)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
