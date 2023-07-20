//
//  NewlyCoinedWordViewController.swift
//  NewlyCoinedWord
//
//  Created by 박태현 on 2023/07/20.
//

import UIKit

class NewlyCoinedWordViewController: UIViewController {

    @IBOutlet var searchTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

private extension NewlyCoinedWordViewController {
    func configureUI() {
        searchTextField.layer.borderColor = UIColor.systemBlack?.cgColor
        searchTextField.layer.borderWidth = 3.0
    }
}
