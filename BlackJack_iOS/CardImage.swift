//
//  CardImage.swift
//  BlackJack_iOS
//
//  Created by Brett Dewerff on 11/20/19.
//  Copyright © 2019 Egroeg. All rights reserved.
//

import UIKit

class CardImage
{
    private var faceUp: Bool
    private var cardImageView: UIImageView
    
    init()
    {
        self.cardImageView = UIImageView(image: UIImage(named: "blue_back"))
        self.faceUp = true
    }
    
    func Display(frameX: Int, frameY: Int, card: Card, view: UIView) -> UIImageView
    {
        var cardImageName = card.toString()
        if self.faceUp == false
        {
            cardImageName = "blue_back"
        }
        let cardImage = UIImage(named: cardImageName)
        self.cardImageView = UIImageView(image: cardImage)
        let cardImageViewWidth = 90
        let cardImageViewHeight = 128
        
        self.cardImageView.frame = CGRect(x: frameX, y: frameY, width: cardImageViewWidth, height: cardImageViewHeight)
        
        //view.addSubview(self.cardImageView)
        return self.cardImageView
    }
    
    func Remove()
    {
        self.cardImageView.removeFromSuperview()
        //self.cardImageView.image = nil
    }
    
    func flip()
    {
        faceUp = !faceUp
    }
}
