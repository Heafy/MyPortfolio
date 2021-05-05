//
//  CustomFontsView.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 29/04/21.
//

import SwiftUI

struct CustomFontsView: View {
    
    private var text: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    @State private var isCustomFont: Bool = false
    
    @State private var selectedFont: Font = .caption2
    private var fonts: [Font] = [ .caption2, .caption, .footnote, .subheadline, .callout, .body, .headline, .title3, .title2, .title, .largeTitle ]
    
    var body: some View {
        ScrollView {
            VStack {
                Toggle("Using custom font", isOn: $isCustomFont)
                
                GroupBox {
                    Text(text)
                        .multilineTextAlignment(.center)
                        .font(isCustomFont ? .custom("SansForgetica-Regular", size: selectedFont.size, relativeTo: .body) : selectedFont)
                    
                } //: GroupBox
                
                Picker("Font", selection: $selectedFont) {
                    ForEach(fonts, id: \.self) {
                        Text($0.name)
                    }
                }
                .pickerStyle(InlinePickerStyle())
                
            } //: VStack
            .padding()
        } //: ScrollView
        
    }
}

struct CustomFontsView_Previews: PreviewProvider {
    static var previews: some View {
        CustomFontsView()
    }
}

extension Font {
    
    var name: String {
        switch self {
        case .caption2:
            return "Caption 2"
        case .caption:
            return "Caption"
        case .footnote:
            return "Footnote"
        case .subheadline:
            return "Subhead"
        case .callout:
            return "Callout"
        case .body:
            return "Body"
        case .headline:
            return "Headline"
        case .title3:
            return "Title 3"
        case .title2:
            return "Title 2"
        case .title:
            return "Title"
        case .largeTitle:
            return "Large title"
        default:
            return ""
        }
    }
    
    var size: CGFloat {
        switch self {
        case .caption2:
            return 11
        case .caption:
            return 12
        case .footnote:
            return 13
        case .subheadline:
            return 15
        case .callout:
            return 16
        case .body:
            return 17
        case .headline:
            return 17
        case .title3:
            return 20
        case .title2:
            return 22
        case .title:
            return 28
        case .largeTitle:
            return 34
        default:
            return 17
        }
    }

    
}
