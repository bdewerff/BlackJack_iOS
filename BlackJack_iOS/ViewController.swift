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
    @IBOutlet var hitButton: UIButton!
    @IBOutlet var standButton: UIButton!
    @IBOutlet var gameWinText: UILabel!
    @IBOutlet var welcomeText: UILabel!
    
    let blackJackDeck = Deck.init(numDecks: 1)
    lazy var playerCardXDimension = 291
    lazy var playerCardYDimension = 257
    lazy var dealerCardXDimension = 291
    lazy var dealerCardYDimension = 20
    
    let blackJackValue = 21
    let playerHand = Hand.init()
    let dealerHand = Hand.init()
    
    lazy private var player = Player.init(hand: playerHand, deck: blackJackDeck)
    lazy private var dealer = Player.init(hand: dealerHand, deck: blackJackDeck)
    
    lazy private var playerHandDisplay = HandDisplay.init(hand: playerHand, frameX: Double(playerCardXDimension), frameY: Double(playerCardYDimension))
    
    lazy private var dealerHandDisplay = HandDisplay.init(hand: dealerHand, frameX: Double(dealerCardXDimension), frameY: Double(dealerCardYDimension))
    
    lazy private var blackJackActions = BlackJackActions.init(deck: blackJackDeck, player: player, dealer: dealer)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        hitButton.isHidden = true
        standButton.isHidden = true
        gameWinText.isHidden = true
    }
    
    @IBAction func stand(_ sender: Any)
    {
        player.playerStand()
        standButton.isHidden = true
        hitButton.isHidden = true
        dealerPlay()
    }
    
    @IBAction func hit(_ sender: Any)
    {
        blackJackActions.Hit(player: player)
        playerHandDisplay.AddNewCardImages(view: gameView)
        checkBlackJack(player: player)
        
        if player.calculateBlackjackHandValue() > blackJackValue
        {
            standButton.isHidden = true
            hitButton.isHidden = true
            displayGameConditions()
        }
    }
    
    @IBAction func deal(_ sender: Any)
    {
        blackJackActions.Deal(player: player, dealer: dealer)
        playerHandDisplay.AddNewCardImages(view: gameView)
        dealerHandDisplay.AddNewCardImages(view: gameView)
        dealerHandDisplay.flipSecondCard(view: gameView)
        dealButton.isHidden = true
        welcomeText.isHidden = true
        hitButton.isHidden = false
        standButton.isHidden = false
        checkBlackJack(player: player)
    }
    
    func checkBlackJack(player: Player)
    {
        if player.calculateBlackjackHandValue() == blackJackValue
        {
            if player.hand.size() > 2
            {
                dealerPlay()
            }
            gameWinText.text = "You have blackjack!"
            gameWinText.isHidden = false
            standButton.isHidden = true
            hitButton.isHidden = true
            perform(#selector(clearTable), with: nil, afterDelay: 3)
        }
    }
    
    func displayGameConditions()
    {
        var array = blackJackActions.GameConditions(player: player, dealer: dealer)
        gameWinText.text = array[0] as? String
        gameWinText.isHidden = false
        perform(#selector(clearTable), with: nil, afterDelay: 3)
    }
    
    func dealerPlay(){
        dealerHandDisplay.flipSecondCard(view: gameView)
        dealerHandDisplay.AddNewCardImages(view: gameView)
        let minDealerLimit: Int = 17
        
        while dealer.calculateBlackjackHandValue() < minDealerLimit
        {
            blackJackActions.Hit(player: dealer)
            dealerHandDisplay.AddNewCardImages(view: gameView)
        }
        
        if dealer.calculateBlackjackHandValue() >= minDealerLimit
        {
            dealerHandDisplay.AddNewCardImages(view: gameView)
            displayGameConditions()
        }
    }
    
    @objc func clearTable()
    {
        playerHandDisplay.clear()
        dealerHandDisplay.clear()
        gameWinText.isHidden = true
        hitButton.isHidden = true
        standButton.isHidden = true
        dealButton.isHidden = false
        player.discardHand()
        dealer.discardHand()
    }
}

