//
//  ViewController.swift
//  Awesome Boggle
//
//  Created by jeastburn on 8/2/17.
//  Copyright © 2017 jeastburn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var boggleView: BoggleView?
    var boggleModel: BoggleModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        boggleView = view as? BoggleView
        boggleModel = BoggleModel()
        boggleView?.delegate = self
        resetButtonTitles()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resetButtonTitles() {
        let numberOfButtons = boggleView?.buttons.count
        
        if let model = boggleModel, let numberOfButtons = numberOfButtons {
                 let titleArray = model.lettersArray(numberOfLetters: numberOfButtons)
            boggleView?.setButtonTitles(titleArray)
        }

    }
    
    func saveWord(word: String) {
        let currentWords = boggleModel?.addWord(word: word)
        boggleView?.allTheWordsLabel.text = currentWords?.joined(separator: ", ")
    }
}

extension ViewController: BoggleViewProtocol {
    func resetButtonPressed() {
        resetButtonTitles()
        boggleModel?.resetAllTheWords()
    }
}

