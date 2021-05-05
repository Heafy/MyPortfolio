//
//  RedactedView.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 27/04/21.
//

import SwiftUI

struct RedactedView: View {
    
    @State var isRedacted: Bool = false
    
    var body: some View {
        VStack {
            Toggle("Redacted", isOn: $isRedacted)
            List{
                CarInfo(model: "Model 3", brand: "Tesla")
//                    .redacted(reason:isRedacted ? .placeholder: [])
                CarInfo(model: "e-Tron", brand: "Audi")
//                    .redacted(reason:isRedacted ? .placeholder: [])
                CarInfo(model: "Mustang Mach-E", brand: "Ford")
//                    .redacted(reason:isRedacted ? .placeholder: [])
                CarInfo(model: "Twizy", brand: "Renault")
//                    .redacted(reason:isRedacted ? .placeholder: [])
                CarInfo(model: "i-Pace", brand: "Jaguar")
//                    .redacted(reason:isRedacted ? .placeholder: [])
            }
            .redactedLoading(when: isRedacted)
            //.redacted(reason:isRedacted ? .placeholder: [])
            .navigationBarTitle("Redacted", displayMode: .inline)
        }.padding()
        .animation(.linear)
    }
}

struct RedactedView_Previews: PreviewProvider {
    static var previews: some View {
        RedactedView()
    }
}

struct CarInfo: View {
    
    var model: String
    var brand: String
    
    var body: some View {
        HStack {
            Image(systemName: "car.circle.fill")
                .resizable()
                .frame(width: 25, height: 25, alignment: .center)
                .scaledToFill()
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 4.0) {
                Text(model)
                    .font(.body)
                Text(brand)
                    .foregroundColor(.gray)
                    .textCase(.uppercase)
                    .font(.caption)
            }.multilineTextAlignment(.leading)
        }
    }
}
