//
//  Deck.swift
//  BlackJack_iOS
//
//  Created by Egroeg on 11/11/19.
//  Copyright © 2019 Egroeg. All rights reserved.
//

import UIKit

class Deck {

    var cards: Array<Card> = []
    var discardedCards: Array<Card> = []

    let deckNum = 1
    let numDecks = 1
    
    init(numDecks: Int){
        cards = []
        discardedCards = []
    
        for _ in 1...numDecks{
            for suit in Card.Suit.allCases{
                for rank in Card.Rank.allCases{
                    cards.append(Card(rank: rank, suit: suit));
            }
        }
    }
    shuffle();
    }
    
    func dealCard() -> Card
    {
        if !cards.isEmpty {
            let cardToDeal: Card = cards[0]
            cards.removeFirst(1)
            return cardToDeal
        } else{
            addDiscardsToDeck()
            return dealCard()
        }
    }
    
    func discardCard(cardToReturn: Card){
        discardedCards.append(cardToReturn)
    }
    
    func addDiscardsToDeck(){
        for card in discardedCards{
            cards.append(card)
        }
        shuffle()
    }
    
    func shuffle(){
        cards.shuffle()
    }

    
}
