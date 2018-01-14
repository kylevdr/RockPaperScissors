//
//  Sign.swift
//  RockPaperScissors
//
//  Created by Kyle VanDeRiet on 1/13/18.
//  Copyright © 2018 Kyle VanDeRiet. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

enum Sign {
    case rock, paper, scissors
    
    static func random() -> Sign {
        let sign = randomChoice.nextInt()
        if sign == 0 {
            return .rock
        } else if sign == 1 {
            return .paper
        } else {
            return .scissors
        }
    }
    
    static func getGameStateFromSigns(playerSign: Sign, computerSign: Sign) -> GameState {
        if playerSign.defeats(computerSign) {
            return .win
        } else if computerSign.defeats(playerSign) {
            return .lose
        } else {
            return .draw
        }
    }
    
    func defeats(_ otherSign: Sign) -> Bool {
        switch (self, otherSign) {
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            return true
        default:
            return false
        }
    }
    
    var emoji : String {
        switch self {
        case .rock:
            return "✊"
        case .paper:
            return "✋"
        case.scissors:
            return "✌️"
        }
    }
}
