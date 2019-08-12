//
//  Card.swift
//  CardDeck
//
//  Created by Blake kvarfordt on 8/12/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import Foundation

struct JsonDictionary: Decodable {
    let cards: [Card]
}

struct Card: Decodable {
    
    let image: URL
    let value: String
    let suit: String
    
    
}
