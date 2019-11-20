//
//  Hand.swift
//  BlackJack_iOS
//
//  Created by Egroeg on 11/18/19.
//  Copyright © 2019 Egroeg. All rights reserved.
//

import UIKit

class Hand{
    
    private var cards: Array<Card> = []
    
    func Hand(){ cards = [].self}
    
    func add(card: Card){
        cards.append(card)
    }
    
    func discard() -> Card{return cards.remove(at: 0)}
    
    func value() -> Int{
        
        if numAces() == 0{
            return hardValue()
        }
        else if numAces() == 1
        {
            if softValue() > 21{ return hardValue()}
            else{ return softValue()}
        }
        else if numAces() > 1
        {
            if softValue() - 10 * (numAces() - 1) > 21{ return hardValue()}
            else {return softValue() - 10 * (numAces() - 1)}
        }
        else {
            return hardValue()
        }
        
    }
    
    func softValue() -> Int{
        var softValue = 0
        for card in cards{
            softValue += card.softValue()
        }
        return softValue
    }
    
    func hardValue() -> Int{
        var handValue = 0
        for card in cards{
            handValue += card.hardValue()
        }
        return handValue
    }
    
    func numAces() -> Int{
        var numAce = 0
        for card in cards{
            if card.isAce(){numAce+=1}
        }
        return numAce
    }
    
    func getCards() -> Array<Card> {return cards}
    
    func size() -> Int{let size = cards.count; return size}
    
    func get(index: Int) -> Card{return cards[index]}
        
    
    
}

