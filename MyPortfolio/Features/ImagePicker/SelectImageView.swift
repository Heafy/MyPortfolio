//
//  SelectImageView.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 29/03/21.
//

import SwiftUI

struct SelectImageView: View {
    
    @State private var isShowActionSheet = false
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        VStack(spacing: 20) {
            Image(uiImage: self.image)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300, alignment: .center)
            
            Button(action: {
                self.isShowActionSheet.toggle()
            }, label: {
                Text("Tomar foto")
            })
            
        } //: VStack
        .actionSheet(isPresented: $isShowActionSheet) {
            ActionSheet(title: Text("Select image source"), message: Text(""), buttons: [
                .default(Text("Camera")) {
                    sourceType = .camera
                    self.isShowPhotoLibrary.toggle()
                },
                .default(Text("Photo library")) {
                    sourceType = .photoLibrary
                    self.isShowPhotoLibrary.toggle()
                    
                },
                .cancel()
            ])
        }
        .sheet(isPresented: $isShowPhotoLibrary) {
            ImagePicker(selectedImage: self.$image, sourceType: self.sourceType)
        }
        .navigationBarTitle("Image Picker", displayMode: .inline)
    }
}

struct SelectImageView_Previews: PreviewProvider {
    static var previews: some View {
        SelectImageView()
    }
}
