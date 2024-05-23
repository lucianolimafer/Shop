//
//  Home.swift
//  Shop
//
//  Created by Luciano Lima Ferreira on 22/05/24.
//

import SwiftUI

struct Home: View {
    @State var currentCategory = "Todos"
    
    @State var listCars = [CarsModel]()
    
    @StateObject var db = Database()
    
    @State var car: CarsModel? = nil
    
    @State var showCar = false
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20, content: {
                    
                    //MARK: Header
                    HStack {
                        Text("**Car Shop**\nLançamentos")
                            .font(.largeTitle)
                        
                        Spacer()
                        
                        Image(systemName: "bell")
                            .padding(.vertical, 25)
                            .padding(.horizontal, 16)
                            .imageScale(.large)
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.black.opacity(0.05), lineWidth: 3)
                            }
                    }
                    
                    //MARK: Categories
                    categoriesView
                        .zIndex(1)
                    
                    //MARK: Cars List
                    carsView
                        .fullScreenCover(isPresented: $showCar, content: {
                            Car(data: car ?? db.listCars[0] )
                        })
                })
                .padding()
                .onAppear() {
                    listCars = db.listCars
                }
            }
            .scrollIndicators(.hidden)
        }
    }
    
    //MARK: cars view
    var carsView: some View {
        VStack {
            ForEach(listCars, id: \.id) { item in
                VStack {
                    AsyncImage(url: URL(string: item.images[0])) { img in
                        img.resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                            .tint(colorScheme == .dark ? .white : .black)
                    }
                    .frame(width: UIScreen.main.bounds.width - 50, height: 200)
                    .clipShape(Rectangle())
                    
                    Text(item.title)
                        .font(.headline.bold())
                    
                    Text(item.price.formatted(.currency(code: "BRL")))
                        .font(.callout)
                }
                .padding(.bottom)
                .background(.gray.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .onTapGesture {
                    car = item
                    showCar = true
                    print("item é o \(item.title)")
                }
            }
        }
        .zIndex(0)
    }
    
    //MARK: categories view
    var categoriesView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15, content: {
                ForEach(sampleBrandsMock, id: \.id) { item in
                    HStack {
                        if !item.icon.isEmpty {
                            Image(item.icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 26, height: 24)
                        }
                        
                        if currentCategory == item.title || item.title == "Todos" {
                            Text(item.title)
                        }
                    }
                    .foregroundStyle(currentCategory == item.title ? .white : .black)
                    .padding()
                    .background(currentCategory == item.title ? .black : .white)
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation {
                            currentCategory = item.title
                            
                            //MARK: filter by brand
                            if item.title == "Todos" {
                                listCars = db.listCars
                            } else {
                                listCars = db.listCars.filter {
                                    $0.brand == item.title
                                }
                            }
                        }
                    }
                    
                }
            })
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
