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
    
    init(faceUp: Bool)
    {
        let _: UIImageView
        self.faceUp = true
    }
    
    func Display(frameX: Int, frameY: Int, card: Card, view: UIView)
    {
        //if faceUp == true { let cardImageName = card.toString() }
        //else { let cardImageName = "blue_back" }
        
        let cardImageName = card.toString() 
        let cardImage = UIImage(named: cardImageName)
        let cardImageView = UIImageView(image: cardImage)
        let cardImageViewWidth = 90
        let cardImageViewHeight = 128
        
        cardImageView.frame = CGRect(x: frameX, y: frameY, width: cardImageViewWidth, height: cardImageViewHeight)
        
        view.addSubview(cardImageView)
    }
    
    func Remove(imageView: UIImageView)
    {
        imageView.removeFromSuperview()
    }
    
    func flip()
    {
        faceUp = !faceUp
    }
}
