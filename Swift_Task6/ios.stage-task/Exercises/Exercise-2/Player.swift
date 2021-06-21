//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        
        var counter = 1
        
        if hand != nil {
            
            
            for i in hand! {
                if i.value.rawValue == card.value.rawValue {
                    counter += 1
                }
            }
            
        }
        
        if counter > 1 {
            return true
        }
        
        return false
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        var counter = 0
        for (card1,card2) in table {
            
            if hand!.contains(where: {($0.value == card1.value) || ($0.value == card2.value)}) {
                counter += 1
            }
        }
        if counter > 0 {
            return true
        }
        
        return false
    }
}
