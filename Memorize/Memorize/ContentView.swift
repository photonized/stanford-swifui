//
//  ContentView.swift
//  Memorize
//
//  Created by Vladislav Jidkov on 2020-05-19.
//  Copyright © 2020 Vladislav Jidkov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture {
                        self.viewModel.choose(card: card)
                }
            }
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(self.viewModel.cards.count == 5 ? Font.title : Font.largeTitle)

    }
}

struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke()
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.orange)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return ContentView(viewModel: EmojiMemoryGame())
    }
}
