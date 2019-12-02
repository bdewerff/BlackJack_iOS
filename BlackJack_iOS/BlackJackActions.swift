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
}
