//
//  UIKitViewController.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 05/05/21.
//

import SwiftUI

class UIKitViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.parent?.navigationItem.title = "UIKit"
        self.view.backgroundColor = .green
        self.button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
        
    @objc func buttonPressed(_ sender: UIButton) {
        let vc = UIHostingController(rootView: SwiftUIView())
        navigationController?.pushViewController(vc, animated: true)
    }
}
