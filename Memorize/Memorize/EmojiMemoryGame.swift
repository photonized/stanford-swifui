//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Vladislav Jidkov on 2020-05-21.
//  Copyright © 2020 Vladislav Jidkov. All rights reserved.
//

import SwiftUI


class EmojiMemoryGame {
    private var game: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count, cardContentFactory: { (pairIndex: Int) -> String in return emojis[pairIndex]})
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return game.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
}
