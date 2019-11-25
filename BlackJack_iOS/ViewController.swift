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
    @IBOutlet var dealerCardImageView1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        let blackJackDeck = Deck.init(numDecks: 1)
        let playerHand = Hand.init()
        let dealerHand = Hand.init()
        let playerHandImages: Array<CardImage> = []
        let dealerHandImages: Array<CardImage> = []
        let playerCardXDimension = playerCardImageView1.frame.origin.x
        let playerCardYDimension = playerCardImageView1.frame.origin.y
        let dealerCardXDimension = dealerCardImageView1.frame.origin.x
        let dealerCardYDimension = dealerCardImageView1.frame.origin.y
        
        playerHand.add(card: blackJackDeck.cards[0])
        playerHand.add(card: blackJackDeck.cards[1])
        dealerHand.add(card: blackJackDeck.cards[2])
        dealerHand.add(card: blackJackDeck.cards[3])
        
        let playerHandDisplay = HandDisplay.init(hand: playerHand, cardImages: playerHandImages, frameX: Double(playerCardXDimension), frameY: Double(playerCardYDimension))

        let dealerHandDisplay = HandDisplay.init(hand: dealerHand, cardImages: dealerHandImages, frameX: Double(dealerCardXDimension), frameY: Double(dealerCardYDimension))
        
        playerHandDisplay.AddNewCardImages(view: gameView)
        dealerHandDisplay.AddNewCardImages(view: gameView)
        
        for card in blackJackDeck.cards
        {
            print(card.toString())
        }
    }
    
}

