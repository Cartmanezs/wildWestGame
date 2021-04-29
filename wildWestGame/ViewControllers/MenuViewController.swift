//
//  ViewController.swift
//  wildWestGame
//
//  Created by Ingvar on 28.04.2021.
//

import UIKit

class MenuViewController: UIViewController {

    @IBAction func playButtonTapped(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newVC = storyboard.instantiateViewController(identifier: "GameViewController") as! GameViewController
        newVC.modalPresentationStyle = .fullScreen
        self.present(newVC, animated: true, completion: nil)
    }
    
    @IBAction func placesButtonTapped(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newVC = storyboard.instantiateViewController(identifier: "PlacesViewController") as! PlacesViewController
        newVC.modalPresentationStyle = .fullScreen
        self.present(newVC, animated: true, completion: nil)
    }
    
    @IBAction func webButtonTapped(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newVC = storyboard.instantiateViewController(identifier: "WebViewController") as! WebViewController
        newVC.modalPresentationStyle = .fullScreen
        self.present(newVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

