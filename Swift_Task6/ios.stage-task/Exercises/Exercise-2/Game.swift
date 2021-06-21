//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {
    
    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        var playerIndex = 0
        var lowestCard = 0
        
        
        for i in 0..<players.count {
            let player = players[i]
            player.hand?.forEach({ (card) in
                if card.isTrump && (card.value.rawValue < lowestCard) {
                    playerIndex = i
                    lowestCard = card.value.rawValue
                }
            })
        }
        
        return players[playerIndex]
    }
}
