//
//  Deck.swift
//  BlackJack_iOS
//
//  Created by Brett Dewerff on 11/15/19.
//  Copyright © 2019 Egroeg. All rights reserved.
//

import UIKit

class Deck {
    
    private var cards: Array<String> = []
    private var discardedCards: Array<String> = []
    let deckNum = 1
    
    
    let numDecks = 1
    
    func Deck(numDecks: Int){
        var cards: Array<String>
        var discardedCards: Array<String>
        
        for _ in 0...1{
            for suit in Card.Suit.values(){
                for rank in Card.Rank.values(){
                    cards.append(Card(cardRank, cardSuit));
                }
            }
        }
        shuffle();
    }
    
    func dealCard(){
        if !cards.isEmpty {
            return cards.removeFirst(1)
        }else{
            addDiscardsToDeck();
            return dealCard();
        }
    }
    
    func discardedCard(cardToReturn: String){
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

