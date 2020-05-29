//
//  MemoryGame.swift
//  Memorize
//
//  Created by Vladislav Jidkov on 2020-05-21.
//  Copyright © 2020 Vladislav Jidkov. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        let chosenIndex: Int = self.index(of: card)
        self.cards[chosenIndex].isFaceUp.toggle()
    }
    
    func index(of card: Card) -> Int {
        for i in 0..<cards.count {
            if cards[i].id == card.id {
                return i
            }
        }
        return 0 // TODO: bogus
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for i in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(i)
            cards.append(Card(content: content, id: i*2))
            cards.append(Card(content: content, id: i*2+1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
        var id: Int
    }
}
