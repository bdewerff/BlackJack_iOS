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
    @IBOutlet var dealButton: UIButton!

    let blackJackDeck = Deck.init(numDecks: 1)
    lazy private var playerCardXDimension = playerCardImageView1.frame.origin.x
    lazy var playerCardYDimension = playerCardImageView1.frame.origin.y
    lazy var dealerCardXDimension = dealerCardImageView1.frame.origin.x
    lazy var dealerCardYDimension = dealerCardImageView1.frame.origin.y

    let playerHand = Hand.init()
    let dealerHand = Hand.init()
    let playerHandImages: Array<CardImage> = []
    let dealerHandImages: Array<CardImage> = []
    
    lazy private var player = Player.init(hand: playerHand, deck: blackJackDeck)
    lazy private var dealer = Player.init(hand: dealerHand, deck: blackJackDeck)
    
    lazy private var playerHandDisplay = HandDisplay.init(hand: playerHand, cardImages: playerHandImages, frameX: Double(playerCardXDimension), frameY: Double(playerCardYDimension))
    
    lazy private var dealerHandDisplay = HandDisplay.init(hand: dealerHand, cardImages: dealerHandImages, frameX: Double(dealerCardXDimension), frameY: Double(dealerCardYDimension))
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    @IBAction func deal(_ sender: Any)
    {
        player.drawCards(numCards: 2)
        dealer.drawCards(numCards: 2)
        
        playerHandDisplay.AddNewCardImages(view: gameView)
        dealerHandDisplay.AddNewCardImages(view: gameView)
        dealButton.isHidden = true
    }
    
}

