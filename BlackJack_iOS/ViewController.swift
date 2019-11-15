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
    
        let card = Card(rank: Card.Rank.Ace, suit: Card.Suit.c)
        print(card.toString())
        
    }

}

