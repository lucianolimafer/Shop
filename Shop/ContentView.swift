//
//  ContentView.swift
//  Shop
//
//  Created by Luciano Lima Ferreira on 18/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab: Int = 0
    @Namespace var namespace
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $currentTab) {
                Home()
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarBackground(.ultraThickMaterial, for: .tabBar)
                    .tag(0)
                
                Text("Search")
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarBackground(.ultraThickMaterial, for: .tabBar)
                    .tag(1)
                
                Text("Cart")
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarBackground(.ultraThickMaterial, for: .tabBar)
                    .tag(2)
                
                Text("Profile")
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarBackground(.ultraThickMaterial, for: .tabBar)
                    .tag(3)
            }
            .edgesIgnoringSafeArea(.all)
            .tint(colorScheme == .dark ? .white : .black)
            
            HStack{
                navBarItem(name: "Inicio", icon: "house",  tab: 0)
                navBarItem(name: "Procurar", icon: "magnifyingglass", tab: 1)
                navBarItem(name: "Carrinho", icon: "bag", tab: 2)
                navBarItem(name: "Perfil", icon: "person", tab: 3)
            }
        }
    }
    
    func navBarItem(name: String, icon: String, tab: Int) -> some View {
                Button {
                    currentTab = tab
                } label: {
                    VStack {
                        if currentTab == tab {
                            VStack {
                                Image(systemName: icon)
                                Text(name)
                                    .padding(.horizontal)
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundColor(colorScheme == .dark ? .black : .gray.opacity(0.2))
                                    .blur(radius: 20)
                            )
                            .matchedGeometryEffect(id: "box", in: namespace)
                            
                        } else {
                            Image(systemName: icon)
                                .foregroundColor(.gray)
                            Text(name)
                                .padding(.horizontal)
                                .foregroundColor(.gray)
                        }
                    }.animation(.spring(), value: currentTab)
                }
                .buttonStyle(.plain)
            }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
