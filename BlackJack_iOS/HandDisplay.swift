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
    private var cardFlipped: Bool
    private var hand: Hand
    private var cardImages: Array<CardImage>
    private var frameX: Double
    private var frameY: Double
    private let cardDifference = 30
    
    init(hand: Hand, frameX: Double, frameY: Double)
    {
        self.hand = hand
        self.cardImages = []
        self.frameX = frameX
        self.frameY = frameY
        self.cardFlipped = false
    }
    
    func AddNewCardImages(view: UIView)
    {
        for index in 0..<self.hand.size()
        {
            if index >= self.cardImages.count
            {
                let cardImage = CardImage.init()
                self.cardImages.append(cardImage)
                self.frameX += Double(cardDifference)
                self.display(index: index, frameX: self.frameX, cardImage: cardImage, view: view)
            }

        }
    }
    
    func display(index: Int, frameX: Double, cardImage: CardImage, view: UIView)
    {
        let UIImageView = cardImage.Display(frameX: Int(frameX), frameY: Int(self.frameY), card: self.hand.getCards()[index], view: view)
        if index >= self.cardImages.count - 1
        {
            self.addNewImageView(view: view, imageView: UIImageView)
        }
    }
    
    func addNewImageView(view: UIView, imageView: UIImageView)
    {
        view.addSubview(imageView)
    }
    
    func flipSecondCard(view: UIView)
    {
        if self.cardImages.count >= 2
        {
            cardImages[1].flip()
            cardImages[1].Remove()
            let UIImageView = cardImages[1].Display(frameX: Int(self.frameX), frameY: Int(self.frameY), card: self.hand.getCards()[1], view: view)
            self.addNewImageView(view: view, imageView: UIImageView)
        }
    }
    
    func clear(){
        for UIcardImage in self.cardImages
        {
            UIcardImage.Remove()
        }
        self.cardImages = []
        self.frameX = 291
    }
}
