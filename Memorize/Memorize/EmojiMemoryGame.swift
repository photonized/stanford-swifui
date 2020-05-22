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
        let emojis: Array<String> = ["👻", "🎃", "🕷", "🕸", "😈", "👿", "🙀", "👹", "👺", "🗝", "💀", "🏴‍☠️"].shuffled()
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...emojis.count), cardContentFactory: { (pairIndex: Int) -> String in return emojis[pairIndex]})
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return game.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
}

struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
