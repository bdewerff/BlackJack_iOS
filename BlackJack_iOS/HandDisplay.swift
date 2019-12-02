//
//  HandDisplay.swift
//  BlackJack_iOS
//
//  Created by Brett Dewerff on 11/20/19.
//  Copyright © 2019 Egroeg. All rights reserved.
//

import UIKit

class HandDisplay
{
    private var hand: Hand
    private var cardImages: Array<CardImage>
    private var frameX: Double
    private var frameY: Double
    private let cardDifference = 30
    
    init(hand: Hand, cardImages: Array<CardImage>, frameX: Double, frameY: Double)
    {
        self.hand = hand
        self.cardImages = cardImages
        self.frameX = frameX
        self.frameY = frameY
    }
    
    func AddNewCardImages(view: UIView)
    {
        for index in 0..<self.hand.size()
        {
            if index >= self.cardImages.count
            {
                let cardImage = CardImage.init(faceUp: true)
                cardImage.Display(frameX: Int(self.frameX), frameY: Int(self.frameY), card: self.hand.getCards()[index], view: view)
                self.cardImages.append(cardImage)
                self.frameX += Double(cardDifference)
            }
        }
    }
    
    func flipSecondCard()
    {
        if self.cardImages.count >= 2
        {
            cardImages[1].flip()
        }
    }
}
