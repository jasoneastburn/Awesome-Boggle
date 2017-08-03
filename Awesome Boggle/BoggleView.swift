//
//  BoggleView.swift
//  Awesome Boggle
//
//  Created by jeastburn on 8/2/17.
//  Copyright © 2017 jeastburn. All rights reserved.
//

import Foundation
import UIKit

protocol BoggleViewProtocol: class {
    func resetButtonPressed()
    func saveWord(word: String)
}

class BoggleView: UIView {
    weak var delegate: BoggleViewProtocol?
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var allTheWordsLabel: UILabel!
    
    func setButtonTitles(_ buttonTitle: [String]) {
        var arrayPlace = 0
        for button in buttons {
            button.setTitle(buttonTitle[arrayPlace], for: .normal)
            arrayPlace += 1
        }
    }
    @IBOutlet weak var wordLabel: UILabel!
    @IBAction func enterPressed(_ sender: UIButton) {
    
        if let word = wordLabel.text {
        delegate?.saveWord(word: word)
        }
        wordLabel.text = ""
    }

    @IBAction func letterPressed(_ sender: UIButton) {
        let letter = sender.titleLabel?.text
        if let wordLabel = wordLabel, let wordLabelText = wordLabel.text, let letter = letter {
            wordLabel.text = wordLabelText + letter
        }
    }
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        delegate?.resetButtonPressed()
        allTheWordsLabel.text = ""
    }
    
}
