//
//  FormsView.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 26/04/21.
//

import SwiftUI

struct FormsView: View {
    
    @State var username: String = ""
    @State var isPrivate: Bool = true
    
    @State private var selectedStrength = "Red"
    let colors = ["Red", "Green", "Blue", "Yellow"]
    
    @State var selectedDate = Date()
    
    var body: some View {
        VStack {
            Form {
                Section(header: HeaderFormView()) {
                    TextField("Nombre", text: $username)
                    TextField("Apellido paterno", text: $username)
                    TextField("Apellido materno", text: $username)
                    TextField("Fecha de nacimiento", text: $username)
                    Toggle(isOn: $isPrivate) {
                        Text("Private Account")
                    }
                }
                
                Section(header: Text("Pickers")) {
                    Picker("Strength", selection: $selectedStrength) {
                        ForEach(colors, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(DefaultPickerStyle())
                    
                    Picker("Strength", selection: $selectedStrength) {
                        ForEach(colors, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(InlinePickerStyle())
                    
                    Picker("Strength", selection: $selectedStrength) {
                        ForEach(colors, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    
                    Picker("Strength", selection: $selectedStrength) {
                        ForEach(colors, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Birthday")) {
                    DatePicker("When is your birthday?", selection: $selectedDate, displayedComponents: .date)
                }
            }
        }
        
    }
}

struct HeaderFormView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Datos generales")
            Text("La siguiente información nos ayudará a crear para ti experiencias personalizadas.")
        }.multilineTextAlignment(.leading)
    }
}

struct FormsView_Previews: PreviewProvider {
    static var previews: some View {
        FormsView()
    }
}

