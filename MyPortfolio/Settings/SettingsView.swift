//
//  SettingsView.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 22/06/21.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var darkMode: Bool = false
    @State private var darkSelection: String = "Auto"
    private var darkOptions: [String] = ["Auto", "Light", "Dark"]
    
    init() {
        darkSelection = UserDefaults.standard.string(forKey: "DarkMode") ?? ""
    }
    
    var body: some View {
        Form {
            Section(header: Text("Dark mode")) {
                Picker("Dark mode", selection: $darkSelection) {
                    ForEach(darkOptions, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .onChange(of: darkSelection, perform: {
                    darkSelection in
                    UserDefaults.standard.setValue(darkSelection, forKey: "darkMode")
//                    print(darkSelection)
                    
                })
            }
        }
        .navigationBarTitle("Settings", displayMode: .inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
