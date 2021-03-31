//
//  TestView.swift
//  Wualub-SwiftUI
//
//  Created by Jorge Martinez on 09/03/21.
//

import SwiftUI

struct TestView: View {
    
    @State private var isAnimating: Bool = false
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().tintColor = .white
    }
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
//                    if isAnimating {
//                        LottieView(name: "loading", loopMode: .loop)
//                    } else {
//                        EmptyView()
//                    }
                    
                    Button(action: {
                        isAnimating.toggle()
                    }, label: {
                        Text("Presioname")
                            .padding()
                            .background(Color.green)
                        
                    })
                }
                
                if isAnimating {
                    LottieView(name: "loading", loopMode: .loop).ignoresSafeArea()
                }
                
                //            LottieView(name: "loading", loopMode: .loop).ignoresSafeArea()
            }
            .navigationBarTitle("Mexico", displayMode: .inline)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
