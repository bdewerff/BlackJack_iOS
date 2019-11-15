//
//  Card.swift
//  BlackJack_iOS
//
//  Created by Brett Dewerff on 11/11/19.
//  Copyright © 2019 Egroeg. All rights reserved.
//

import UIKit

public class Card
{
    enum Suit: String {
        case d
        case s
        case c
        case h
    }
    
    enum Rank: String {
        case Ace = "a"
        case Two = "2"
        case Three = "3"
        case Four = "4"
        case Five = "5"
        case Six = "6"
        case Seven = "7"
        case Eight = "8"
        case Nine = "9"
        case Ten = "10"
        case Jack = "j"
        case Queen = "q"
        case King = "k"
    }
    
    private let suit: Suit
    private let rank: Rank
    
    init(rank: Rank, suit: Suit)
    {
        self.suit = suit
        self.rank = rank
    }

    func softValue() -> Int
    {
        if isAce() {return 11}
        else {return nonAceValue()}
    }
    
    func hardValue() -> Int
    {
        if isAce() {return 1}
        else {return nonAceValue()}
    }
    
    func nonAceValue() -> Int
    {
        switch (self.rank)
        {
            case .Jack, .Queen, .King:
                return 10
            default:
                return Int(self.rank.rawValue) ?? 0
        }
    }
    
    func isAce() -> Bool
    {
        return self.rank == Rank.Ace
    }
    
    func toString() -> String
    {
        var description: String {return self.suit.rawValue + self.rank.rawValue}
        return description
    }
}

