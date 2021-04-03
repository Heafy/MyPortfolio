//
//  OnboardingView.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 02/04/21.
//

import SwiftUI

struct OnboardingView: View {
    
    var models: [OnboardingModel] = [
        OnboardingModel(systemImage: "1.circle", title: "First Onboarding Model Title", content: "First Onboarding Model Content", colors: [Color.yellow, Color.red]),
        OnboardingModel(systemImage: "2.circle", title: "Second Onboarding Model Title", content: "Second Onboarding Model Content", colors: [Color.red, Color.blue]),
        OnboardingModel(systemImage: "3.circle", title: "Third Onboarding Model Title", content: "Third Onboarding Model Content", colors: [Color.blue, Color.green]),
        OnboardingModel(systemImage: "4.circle", title: "Fourth Onboarding Model Title", content: "Fourth Onboarding Model Content", colors: [Color.green, Color.yellow]),
    ]
    @State private var selection = 0
    
    var body: some View {
        VStack {
            TabView(selection: $selection) {
                
                OnboardingCardView(model: models[0])
                    .tag(0)
             
                OnboardingCardView(model: models[1])
                    .tag(1)
             
                OnboardingCardView(model: models[2])
                    .tag(2)
             
                OnboardingCardView(model: models[3])
                    .tag(3)
            }
            .tabViewStyle(PageTabViewStyle())
            .padding(.vertical, 20)
            .animation(.easeInOut)
            .transition(.slide)
            
            Button(action: {
                selection = (selection + 1) % 4
            }, label: {
                Text("Button")
                    .padding()
                    .font(.callout)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(4)
            })
        } //: VStack
        .padding(.bottom)
        .navigationBarTitle("Onboarding", displayMode: .inline)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
