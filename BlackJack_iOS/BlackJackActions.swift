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
    
    func stand(player: Player)
    {
        player.playerStand()
    }
    
    func hit(player: Player)
    {
        player.drawCards(numCards: 1)
    }
    
    func doubleDown(betAmount: Int) -> Int
    {
        //betAmount *= 2
        return betAmount
    }
    
    func gameConditions(amountBet: Int, player: Player, dealer: Player)-> Array<Any>{
        var playerHandValue: Int = player.calculateBlackjackHandValue()
        var dealerHandValue: Int = dealer.calculateBlackjackHandValue()
        var array = [String]()
        
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
}
