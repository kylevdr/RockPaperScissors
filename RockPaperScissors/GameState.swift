//
//  GameState.swift
//  RockPaperScissors
//
//  Created by Kyle VanDeRiet on 1/13/18.
//  Copyright © 2018 Kyle VanDeRiet. All rights reserved.
//

import Foundation

enum GameState {
    case start, win, lose, draw
    
    var text : String {
        switch self {
        case .start:
            return "Choose Rock, Paper, or Scissors"
        case .win:
            return "You Won!"
        case .lose:
            return "You Lost :("
        case .draw:
            return "It's a tie!"
        }
    }
}
