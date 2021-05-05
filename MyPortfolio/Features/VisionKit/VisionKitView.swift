//
//  VisionKitView.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 12/04/21.
//

import SwiftUI

struct VisionKitView: View {
    
    @ObservedObject var viewModel = VisionKitViewModel()
    
    var body: some View {
        VStack {
            Image("testvision")
                .resizable()
                .frame(width: 150, height: 100, alignment: .center)
            List(viewModel.texts, id: \.self) {
                item in
                Text(item)
            }
        }.onAppear(perform: {
            viewModel.processImage()
        })
    }
}

struct VisionKitView_Previews: PreviewProvider {
    static var previews: some View {
        VisionKitView()
    }
}
