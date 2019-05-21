//
//  ViewController.swift
//  DeckOfCardsC
//
//  Created by Bobba Kadush on 5/21/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageViewLabel: UIImageView!
    @IBOutlet weak var codeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func drawButtonTapped(_ sender: Any) {
        SRHCardController.fetchCardCompletion { (card) in
            DispatchQueue.main.async {
                guard let card = card else {return}
                self.codeLabel.text = card.code
                self.setCardImage(for: card)
            }
        }
    }
    
    func setCardImage(for card: SRHCard){
        SRHCardController.fetchCardImageURL(card.image) { (image) in
            DispatchQueue.main.async {
                self.imageViewLabel.image = image
            }
        }
    }
}
