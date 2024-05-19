//
//  Splash.swift
//  Shop
//
//  Created by Luciano Lima Ferreira on 18/05/24.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

struct Splash: View {
    @State var isActive = false
    
    var body: some View {
        VStack {
            if isActive {
                if Auth.auth().currentUser != nil {
                    ContentView()
                } else {
                    Onboarding()
                }
            } else {
                Text("SHOP")
                    .font(.largeTitle.bold())
            }
        }
        .onAppear() {
            // animation
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    isActive = true
                }
            }
        }
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash(isActive: false)
    }
}
