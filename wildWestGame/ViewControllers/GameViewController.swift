//
//  GameViewController.swift
//  wildWestGame
//
//  Created by Ingvar on 28.04.2021.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
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
            
            if sender.imageView?.image == UIImage(named: currentImage) {
                scorePoints += 10
                currentImage = ""
            } else if !currentImage.isEmpty {
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    let image = UIImage(named: "box")
                    sender.setImage(image, for: .normal)
                    UIView.transition(with: sender, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                })
                scorePoints -= 5
            } else {
                currentImage = buttonImages[sender.tag - 1]
            }
        }
        scoreLabel.text = "Score: \(scorePoints)"
    }
    
    private var buttonImages = ["cowboy","cowboy2","hat","rev","kar","dead","cowboy","cowboy2","hat","rev","kar","dead"]
    private var currentImage = ""
    private var scorePoints = 0
    private var indexElement = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
    }
    
    private func resetGame() {
        for button in buttons {
            button.setImage(UIImage(named: "box"), for: .normal)
        }
        scorePoints = 0
        scoreLabel.text = "Score: \(scorePoints)"
        buttonImages.shuffle()
        currentImage = ""
    }
}
