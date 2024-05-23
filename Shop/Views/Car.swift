//
//  Car.swift
//  Shop
//
//  Created by Luciano Lima Ferreira on 23/05/24.
//

import SwiftUI

struct Car: View {
    var data: CarsModel
    
    @Environment(\.presentationMode) var dismiss
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack {
                        ZStack(alignment: .top) {
                            ImageSlider(images: data.images)
                                .frame(height: 400)
                                .clipShape(RoundedRectangle(cornerRadius: 50))
                                .padding(10)
                            
                        //MARK: navigation
                            HStack {
                                Image(systemName: "arrow.left")
                                    .onTapGesture {
                                        dismiss.wrappedValue.dismiss()
                                    }
                                
                                Spacer()
                                
                                Image(systemName: "heart")
                            }
                            .padding(.top, safeArea().top)
                            .padding(.horizontal, 20)
                            .imageScale(.large)
                        }
                        
                        Image("\(data.brand.lowercased())-icon")
                        
                        Text(data.title)
                            .font(.largeTitle.bold())
                        Text(data.price.formatted(.currency(code: "BRL")))
                            .font(.title.bold())
                        
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Detalhes")
                                .font(.title2.bold())
                            Text(data.description)
                                .multilineTextAlignment(.leading)
                        }
                        .padding()
                    }
                }
                
                //MARK: bottombar
                HStack {
                    //MARK: PRICE
                    VStack(alignment: .leading) {
                        Text(data.price.formatted(.currency(code: "BRL")))
                            .font(.title2.bold())
                    }
                    .frame(width: UIScreen.main.bounds.width / 2.5, height: 60)
                    
                    
                    //MARK: Add To Cart
                    Button("Comprar") {
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(colorScheme == .dark ? .white : .black)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .foregroundColor(colorScheme == .dark ? .black : .white)
                    .fontWeight(.semibold)
                }
                .padding(.horizontal)
            }
            .edgesIgnoringSafeArea(.top)
        }
        .scrollIndicators(.hidden)
    }
}

struct Car_Previews: PreviewProvider {
    static var previews: some View {
        Car(data: sampleCarsMock[0])
    }
}

extension View {
    func safeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        
        return safeArea
    }
}
