//
//  OnboardingCardView.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 01/04/21.
//

import SwiftUI

struct OnboardingCardView: View {
    
    var model: OnboardingModel
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: model.systemImage)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
            Text(model.title)
                .font(.title2)
            if let content = model.content {
                Text(content)
                    .font(.title3)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: model.colors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
}

struct OnboardingCardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCardView(model: OnboardingModel(systemImage: "1.circle", title: "Onboarding Model Title", content: "Onboarding Model Content", colors: [Color.gray, Color.green]))
    }
}
