//
//  SelectImageView.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 29/03/21.
//

import SwiftUI

struct SelectImageView: View {
    
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    
    var body: some View {
        NavigationView {
            VStack {
                Image(uiImage: self.image)
                    .resizable()
                    .scaledToFit()
                
                Button(action: {
                    self.isShowPhotoLibrary = true
                }, label: {
                    Text("Take photo")
                })
            }
        }.sheet(isPresented: $isShowPhotoLibrary) {
            ImagePicker(selectedImage: self.$image, sourceType: .photoLibrary)
        }
    }
}

struct SelectImageView_Previews: PreviewProvider {
    static var previews: some View {
        SelectImageView()
    }
}
