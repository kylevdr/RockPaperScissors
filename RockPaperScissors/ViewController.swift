//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Kyle VanDeRiet on 1/13/18.
//  Copyright © 2018 Kyle VanDeRiet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var computerSignLabel: UILabel!
    @IBOutlet weak var gameStatusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func chooseRock(_ sender: Any) {
        play(playerSign: .rock)
    }
    @IBAction func choosePaper(_ sender: Any) {
        play(playerSign: .paper)
    }
    @IBAction func chooseScissors(_ sender: Any) {
        play(playerSign: .scissors)
    }
    @IBAction func playAgain(_ sender: Any) {
        updateUI(gameState: .start)
    }
    @IBOutlet var playerChoiceButtons: [UIButton]!
    
    func play(playerSign: Sign) {
        let computerSign = Sign.random()
        let gameState = GameState.getFromSigns(playerSign: playerSign, computerSign: computerSign)
        updateUI(gameState: gameState)
        computerSignLabel.text = computerSign.emoji
        for button in playerChoiceButtons {
            button.isEnabled = false
            // hide the buttons that the player did not choose
            if button.titleLabel?.text == playerSign.emoji {
                button.isHidden = false
            } else {
                button.isHidden = true
            }
        }
        playAgainButton.isHidden = false
    }
    
    func updateUI(gameState: GameState) {
        gameStatusLabel.text = gameState.text
        if gameState == .start {
            computerSignLabel.text = "😈"
            playAgainButton.isHidden = true
            for button in playerChoiceButtons {
                button.isEnabled = true
                button.isHidden = false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(gameState: .start)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

