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
    lazy private var playerCardXDimension = playerCardImageView1.frame.origin.x
    lazy var playerCardYDimension = playerCardImageView1.frame.origin.y
    lazy var dealerCardXDimension = dealerCardImageView1.frame.origin.x
    lazy var dealerCardYDimension = dealerCardImageView1.frame.origin.y
    
    let blackJackValue = 21
    let playerHand = Hand.init()
    let dealerHand = Hand.init()
    let playerHandImages: Array<CardImage> = []
    let dealerHandImages: Array<CardImage> = []
    
    lazy private var player = Player.init(hand: playerHand, deck: blackJackDeck)
    lazy private var dealer = Player.init(hand: dealerHand, deck: blackJackDeck)
    
    lazy private var playerHandDisplay = HandDisplay.init(hand: playerHand, cardImages: playerHandImages, frameX: Double(playerCardXDimension), frameY: Double(playerCardYDimension))
    
    lazy private var dealerHandDisplay = HandDisplay.init(hand: dealerHand, cardImages: dealerHandImages, frameX: Double(dealerCardXDimension), frameY: Double(dealerCardYDimension))
    
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
        dealerPlay()
    }
    
    @IBAction func hit(_ sender: Any)
    {
        blackJackActions.Hit(player: player)
        playerHandDisplay.AddNewCardImages()
        playerHandDisplay.display(view: gameView)
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
        playerHandDisplay.AddNewCardImages()
        dealerHandDisplay.AddNewCardImages()
        dealerHandDisplay.flipSecondCard()
        dealerHandDisplay.display(view: gameView)
        playerHandDisplay.display(view: gameView)
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
        }
    }
    
    func displayGameConditions()
    {
        var array = blackJackActions.GameConditions(player: player, dealer: dealer)
        gameWinText.text = array[0] as? String
        gameWinText.isHidden = false
        clearTable()
    }
    
    func dealerPlay(){
        dealerHandDisplay.flipSecondCard()
        let minDealerLimit: Int = 17
        
        while dealer.calculateBlackjackHandValue() < minDealerLimit{
            blackJackActions.Hit(player: dealer)
            dealerHandDisplay.AddNewCardImages()
            dealerHandDisplay.display(view: gameView)
        }
        
        if dealer.calculateBlackjackHandValue() >= minDealerLimit{
            dealerHandDisplay.AddNewCardImages()
            dealerHandDisplay.display(view: gameView)
            displayGameConditions()
        }
    }
    
    func clearTable(){
        playerHandDisplay.clear()
        dealerHandDisplay.clear()
        gameWinText.isHidden = true
        player.discardHand()
        dealer.discardHand()
    }
    
    
    
    let timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { timer in
        ViewController.self.clearTable()
    }
    
    func clearTableDelay(){
        timer()
    }
    
    
}

