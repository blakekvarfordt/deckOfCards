//
//  DrawViewController.swift
//  CardDeck
//
//  Created by Blake kvarfordt on 8/12/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import UIKit

class DrawViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var suitLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Actions
    @IBAction func drawButtonTapped(_ sender: Any) {
        
        CardController.shared.fetchCard { (card) in
            guard let card = card else { return }
            DispatchQueue.main.async {
                self.suitLabel.text = card.suit
                self.valueLabel.text = card.value
            }
            CardController.shared.fetchCardImage(imageString: card.image, completion: { (image) in
                
                DispatchQueue.main.async {
                    self.cardImageView.image = image
                }
            })
        }
    }
    
 

}
