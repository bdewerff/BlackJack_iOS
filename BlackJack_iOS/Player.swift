//
//  Player.swift
//  BlackJack_iOS
//
//  Created by Egroeg on 11/20/19.
//  Copyright © 2019 Egroeg. All rights reserved.
//

import UIKit

class Player {
    
    var hand: Hand
    var isPlayerDone: Bool = false
    var deck: Deck
    
    init(){
        hand = 
    }
    
    func drawCards(numCards: Int){
        for _ in 1...numCards{
            hand.add(card: sel)
        }
    }
    
    func discardHand(){
        let handSize = hand.size()
        for _ in 1...handSize{
            self.deck.discardCard(cardToReturn: hand.discard())
        }
    }

}
