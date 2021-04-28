//
//  PlacesModel.swift
//  wildWestGame
//
//  Created by Ingvar on 28.04.2021.
//

import Foundation

struct PlacesSource: Decodable {
    let places: [PlacesInfo?]
    
    struct PlacesInfo: Decodable {
        let image: String?
        let city: String?
        let country: String?
    }
}
