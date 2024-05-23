//
//  Database.swift
//  Shop
//
//  Created by Luciano Lima Ferreira on 23/05/24.
//

import SwiftUI
import FirebaseFirestore

class Database: ObservableObject {
    @Published var listCars = [CarsModel]()
    
    init() {
        getCars()
    }
    
    func getCars() {
        let db = Firestore.firestore()
        
        db.collection("CARS").addSnapshotListener { snapshot, error in
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    self.listCars.append(
                        CarsModel(
                            id: document.documentID,
                            title: document.get("title") as! String,
                            brand: document.get("brand") as! String,
                            description: document.get("description") as! String,
                            images: document.get("images") as! [String],
                            reviews: [sampleReview],
                            price: 100000 ))
                }
            }
        }
    }
}
