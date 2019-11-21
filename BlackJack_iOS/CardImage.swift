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
    init(view: UIView)
    {
        /*view.viewWithTag("playerCardImage")
        {
            let template = view.size.width
        }*/
    }
    func Create(frameX: Int, frameY: Int, card: Card, view: UIView)
    {
        let cardImageName = card.toString()
        let cardImage = UIImage(named: cardImageName)
        let cardImageView = UIImageView(image: cardImage)
        let cardImageViewWidth = 90
        let cardImageViewHeight = 128
        
        cardImageView.frame = CGRect(x: frameX, y: frameY, width: cardImageViewWidth, height: cardImageViewHeight)
    }
    
}
