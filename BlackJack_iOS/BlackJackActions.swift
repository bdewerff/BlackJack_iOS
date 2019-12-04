//
//  BlackJackActions.swift
//  BlackJack_iOS
//
//  Created by Brett Dewerff on 11/21/19.
//  Copyright © 2019 Egroeg. All rights reserved.
//

import UIKit

class BlackJackActions
{
    var deck: Deck!
    var player: Player!
    var dealer: Player!
    var blackJackValue: Int
    
    init(deck: Deck, player: Player, dealer: Player){
        self.deck = deck
        self.player = player
        self.dealer = dealer
        blackJackValue = 21
    }
    
    func Deal(player: Player, dealer: Player)
    {
        player.drawCards(numCards: 2)
        dealer.drawCards(numCards: 2)
    }
    
    func Stand(player: Player)
    {
        player.playerStand()
    }
    
    func Hit(player: Player)
    {
        player.drawCards(numCards: 1)
    }
    
    func DoubleDown(betAmount: Int) -> Int
    {
        return betAmount*2
    }
    
    func GameConditions(player: Player, dealer: Player)-> Array<Any>
    {
        let playerHandValue: Int = player.calculateBlackjackHandValue()
        let dealerHandValue: Int = dealer.calculateBlackjackHandValue()
        var array: [String] = [""]
        
        if player.calculateBlackjackHandValue() > blackJackValue{
            array[0] = "You have busted!"
        }
        else if playerHandValue < blackJackValue && dealerHandValue > blackJackValue{
            array[0] = "Dealer has busted, You Win!"
        }
        else if playerHandValue < blackJackValue && playerHandValue == dealerHandValue{
            array[0] = "It is a push. You get your money back."
        }
        else if playerHandValue < blackJackValue && dealerHandValue > playerHandValue{
            array[0] = "Dealer Wins"
        }
        else{
            array[0] = "You Win"
        }
        return array
    }
    
    func checkBlackJack(player: Player)
    {
        if player.calculateBlackjackHandValue() == blackJackValue
        {
            
        }
    }
}
