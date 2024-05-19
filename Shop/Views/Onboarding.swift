//
//  Onboarding.swift
//  Shop
//
//  Created by Luciano Lima Ferreira on 18/05/24.
//

import SwiftUI

struct Onboarding: View {
    @State private var isActive = false
    @State private var isExpanded = false
    @State private var offset = CGSize.zero
    
    var body: some View {
        if isActive {
            SignIn()
        } else {
            ZStack(alignment: .top) {
                VStack {
                    Spacer()
                    
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [.red, .clear, .clear, .clear],
                                center: .center,
                                startRadius: 0,
                                endRadius: UIScreen.main.bounds.width
                            )
                        )
                        .padding(.bottom, -(UIScreen.main.bounds.width / 2))
                        .scaleEffect(isExpanded ? 20 : 2)
                }
                .frame(height: .infinity)
                .zIndex(isExpanded ? 2 : 0)
                
                VStack(spacing: 15, content: {
                    Spacer()
                    
                    Image("car-onboarding")
                        .resizable()
                        .scaledToFit()
                    
                    Text("Permaneça com\nsua essência")
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.center)
                    
                    Text("Ficou mais fácil encontrar seu carro novo ou seminovo e realizar seu sonho")
                        .multilineTextAlignment(.center)
                        .opacity(0.5)
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "chevron.up")
                        
                        Text("Iniciar")
                            .padding(.top)
                    }
                    .fontWeight(.medium)
                })
                .opacity(isExpanded ? 0 : 1)
                .offset(offset)
            }
            .gesture(
                DragGesture()
                    .onEnded({
                        value in if value.translation.height < 50 {
                            withAnimation(.easeInOut(duration: 2)) {
                                offset = value.translation
                                isExpanded = true
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                withAnimation {
                                    isActive.toggle()
                                }
                            }
                        }
                    })
            )
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image("onboarding_back")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )
            .preferredColorScheme(.dark)
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
