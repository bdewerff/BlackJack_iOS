//
//  ViewController.swift
//  BlackJack_iOS
//
//  Created by Egroeg on 11/10/19.
//  Copyright © 2019 Egroeg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let blackJackDeck = Deck.init(numDecks: 1)
        
        for card in blackJackDeck.cards
        {
            print(card.toString())
        }
    }

}

