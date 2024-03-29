//
//  Player.swift
//  BlackJack_iOS
//
//  Created by Egroeg on 11/20/19.
//  Copyright © 2019 Egroeg. All rights reserved.
//

import UIKit

class Player {
    
    var hand: Hand!
    var isPlayerDone: Bool = false
    var deck: Deck!
    
    init(hand: Hand, deck: Deck)
    {
        self.hand = hand
        self.deck = deck
    }
    
    func drawCards(numCards: Int){
        for _ in 1...numCards{
            hand.add(card: self.deck.dealCard())
        }
    }
    
    func discardHand(){
        let handSize = hand.size()
        for _ in stride(from: 0, to: handSize, by: 1)
        {
            self.deck.discardCard(cardToReturn: hand.discard())
        }
    }
    
    func calculateBlackjackHandValue()->Int{return hand.value()}
    
    func checkIfPlayerBusts(){
        if(calculateBlackjackHandValue()>21){
            isPlayerDone = true
        }
    }
    
    func playerStand(){ isPlayerDone = true}
    
    func getHand() -> Hand{return hand}

}
