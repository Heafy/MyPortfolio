//
//  UIKitViewControllerRepresentable.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 05/05/21.
//

import SwiftUI

struct UIKitViewControllerRepresentable: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> some UIViewController {
        guard let vc = UIStoryboard.init(name: "UIKit", bundle: nil).instantiateViewController(identifier: "UIKitViewController") as? UIKitViewController else {
            fatalError("No VC for ID")
        }
        return vc
    }
    
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        print("updateUIViewController")
    }
}
