//
//  LottieView.swift
//  Wualub-SwiftUI
//
//  Created by Jorge Martinez on 09/03/21.
//

import Lottie
import SwiftUI

struct LottieView: UIViewRepresentable {
    
    var name = "loading"
    var loopMode: LottieLoopMode = .loop

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)

        let animationView = AnimationView()
        let animation = Animation.named(name)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        //view.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
