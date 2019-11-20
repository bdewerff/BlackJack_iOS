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
        
        let startingx = 300
        let startingy = 239
        let width = 90
        let height = 128
        
        let blackJackDeck = Deck.init(numDecks: 1)
        
        let imageName = blackJackDeck.cards[0].toString()
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        
        let imageName2 = blackJackDeck.cards[1].toString()
        let image2 = UIImage(named: imageName2)
        let imageView2 = UIImageView(image: image2)
    
        imageView.frame = CGRect(x: startingx, y: startingy, width: width, height: height)
        imageView2.frame = CGRect(x: startingx + 20, y: startingy, width: width, height: height)
        
        view.addSubview(imageView)
        
        for card in blackJackDeck.cards
        {
            print(card.toString())
        }
    }

}

