//
//  AuthView.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 29/03/21.
//

import LocalAuthentication
import SwiftUI

struct AuthView: View {
    
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if self.isUnlocked {
                Text("Unlocked").foregroundColor(.green)
            } else {
                Text("Locked").foregroundColor(.red)
            }
        }
        .font(.title)
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                DispatchQueue.main.async {
                    if success {
                        // authenticated successfully
                        self.isUnlocked = true
                    } else {
                        // there was a problem
                        print(error?.localizedDescription ?? "Failed to authenticate")
                    }
                }
            }
        } else {
            print("No biometrics")
            // no biometrics
        }
    }
    
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
