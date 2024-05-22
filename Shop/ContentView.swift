//
//  ContentView.swift
//  Shop
//
//  Created by Luciano Lima Ferreira on 18/05/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Image(systemName: "house")
                    Text("Início")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.ultraThickMaterial, for: .tabBar)
            
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Procurar")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.ultraThickMaterial, for: .tabBar)
            
            Text("Cart")
                .tabItem {
                    Image(systemName: "bag")
                    Text("Carrinho")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.ultraThickMaterial, for: .tabBar)
            
            Text("Profile")
                .tabItem {
                    Image(systemName: "person")
                    Text("Perfil")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.ultraThickMaterial, for: .tabBar)
        }
        .tint(colorScheme == .dark ? .white : .black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
