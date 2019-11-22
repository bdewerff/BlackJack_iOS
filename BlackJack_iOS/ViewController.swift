//
//  ViewController.swift
//  BlackJack_iOS
//
//  Created by Egroeg on 11/10/19.
//  Copyright © 2019 Egroeg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var playerCardImageView: UIImageView!
    @IBOutlet var gameView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        let blackJackDeck = Deck.init(numDecks: 1)
        blackJackDeck.dealCard()
        
        let playerCardXDimension = playerCardImageView.frame.origin.x
        let playerCardYDimension = playerCardImageView.frame.origin.y
        
        let cardImage = CardImage.init()
        cardImage.Create(frameX: Int(playerCardXDimension), frameY: Int(playerCardYDimension), card: blackJackDeck.cards[0], view: gameView)
    
        for card in blackJackDeck.cards
        {
            print(card.toString())
        }
    }
    
}

