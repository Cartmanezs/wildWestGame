//
//  PlacesViewController.swift
//  wildWestGame
//
//  Created by Ingvar on 28.04.2021.
//

import UIKit

class PlacesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func backButtonPressed(_ sender: Any) {
    }
    
    private var dataFetcherService = DataFetcherService()
    private var places: [PlacesSource.PlacesInfo?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.layer.cornerRadius = 10
        tableView.layer.masksToBounds = true
        
        dataFetcherService.fetchPlaces { [weak self] (placesResult) in
            guard let `self` = self, let myPlaces = placesResult?.places else { return }
            self.places = myPlaces
            self.tableView.reloadData()
        }
    }
}

extension PlacesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PlacesTableViewCell
        let place = places[indexPath.row]
        cell.cityLabel.text = place?.city
        cell.countyLabel.text = place?.country
        return cell
    }
}

extension PlacesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}