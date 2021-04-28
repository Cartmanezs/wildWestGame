//
//  DataFetcherService.swift
//  wildWestGame
//
//  Created by Ingvar on 28.04.2021.
//

import Foundation

class DataFetcherService {
    
    var dataFetcher: DataFetcher

    private let sourceURL = "https://gist.githubusercontent.com/nivol05/530e2293fa8dcba92fd26677779567a8/raw/31f2d8bf29b39c9f0318a64b83411a16e743ceb6/PlacesQuiz.json"
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
    func fetchPlaces(completion: @escaping (PlacesSource?) -> Void) {
        let url = sourceURL
        dataFetcher.fetchGenericJSONData(urlString: url, response: completion)
    }
}
