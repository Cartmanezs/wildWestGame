//
//  GameViewController.swift
//  wildWestGame
//
//  Created by Ingvar on 28.04.2021.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet var buttons: [UIButton]!
    
    @IBAction func restartButtonPressed(_ sender: Any) {
        resetGame()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newVC = storyboard.instantiateViewController(identifier: "MenuViewController") as! MenuViewController
        newVC.modalPresentationStyle = .fullScreen
        self.present(newVC, animated: true, completion: nil)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.imageView?.image == UIImage(named: "box") {
            let image = UIImage(named: buttonImages[sender.tag - 1])
            sender.setImage(image, for: .normal)
            UIView.transition(with: sender, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        } else {
            let image = UIImage(named: "box")
            sender.setImage(image, for: .normal)
            UIView.transition(with: sender, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
    }
    
    private var buttonImages = ["cowboy","cowboy2","hat","rev","kar","dead","cowboy","cowboy2","hat","rev","kar","dead"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonImages.shuffle()
    }
    
    private func resetGame() {
        for button in buttons {
            button.imageView?.image = UIImage(named: "box")
        }
        buttonImages.shuffle()
    }
}
