//
//  ImageSlider.swift
//  Shop
//
//  Created by Luciano Lima Ferreira on 23/05/24.
//

import SwiftUI

struct ImageSlider: View {
    var images: [String]
    
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { img in
                AsyncImage(url: URL(string: img)) { Image in
                    Image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}
