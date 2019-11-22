//
//  ViewController.swift
//  BlackJack_iOS
//
//  Created by Egroeg on 11/10/19.
//  Copyright © 2019 Egroeg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var gameView: UIView!
    @IBOutlet var playerCardImageView1: UIImageView!
    @IBOutlet var playerCardImageView2: UIImageView!
    @IBOutlet var dealerCardImageView1: UIImageView!
    @IBOutlet var dealerCardImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        let blackJackDeck = Deck.init(numDecks: 1)
        let playerHand = Hand.init()
        let dealerHand = Hand.init()
        playerHand.add(card: blackJackDeck.cards[0])
        playerHand.add(card: blackJackDeck.cards[1])
        dealerHand.add(card: blackJackDeck.cards[2])
        dealerHand.add(card: blackJackDeck.cards[3])
        
        print(dealerHand.getCards())
        print(playerHand.getCards())
        
        let playerCardXDimension = playerCardImageView1.frame.origin.x
        let playerCardYDimension = playerCardImageView1.frame.origin.y
        let dealerCardXDimension = dealerCardImageView1.frame.origin.x
        let dealerCardYDimension = dealerCardImageView1.frame.origin.y
        
        /*for x: Int
        {
            let cardImage = CardImage.init()
            cardImage.Create(frameX: Int(playerCardXDimension), frameY: Int(playerCardYDimension), card: card, view: gameView)
        }*/
        
        for card in dealerHand.getCards()
        {
            let cardImage = CardImage.init()
            cardImage.Create(frameX: Int(dealerCardXDimension), frameY: Int(dealerCardYDimension), card: card, view: gameView)
        }
        
        
    
        for card in blackJackDeck.cards
        {
            print(card.toString())
        }
    }
    
}

