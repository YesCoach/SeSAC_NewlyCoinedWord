//
//  WordViewController.swift
//  NewlyCoinedWord
//
//  Created by 박태현 on 2023/07/21.
//

import UIKit

class WordViewController: UIViewController {

    @IBOutlet var wordTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didReturnKeyEntered(_ sender: UITextField) {
        print(#function)
        resultLabel.text = sender.text
    }

}
