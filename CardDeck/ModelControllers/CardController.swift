//
//  CardController.swift
//  CardDeck
//
//  Created by Blake kvarfordt on 8/12/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import UIKit

class CardController {
    
    static let shared = CardController()
    
    let baseUrl = URL(string: "https://deckofcardsapi.com/api/deck/567xvots0k3l/draw/")!
    
    // Escaping: - escape out of the scope of this function
    func fetchCard(completion: @escaping (Card?) -> Void) {
        var urlRequest = URLRequest(url: baseUrl)
        urlRequest.httpMethod = "Get"
        urlRequest.addValue("1", forHTTPHeaderField: "count")
        
        URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            
            if let error = error {
                print("Error fetching a card \(error) \(error.localizedDescription)")
                completion(nil); return
            }
            guard let data = data else { return }
            do {
                let card = try JSONDecoder().decode(JsonDictionary.self, from: data).cards.first
                completion(card)
            } catch {
                print("Error fetching a card \(error) \(error.localizedDescription)")
            }
        }.resume()
    }
    
    func fetchCardImage(imageString: URL?, completion: @escaping (UIImage?) -> Void) {
        guard let url = imageString else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                print("Error fetching image \(error)")
                completion(nil); return
            }
            guard let data = data else { return }
            let image = UIImage(data: data)
            completion(image)
        }.resume()
    }
}
