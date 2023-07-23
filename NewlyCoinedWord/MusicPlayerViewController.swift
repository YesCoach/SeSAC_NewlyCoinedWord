//
//  MusicPlayerViewController.swift
//  NewlyCoinedWord
//
//  Created by 박태현 on 2023/07/21.
//

import UIKit

class MusicPlayerViewController: UIViewController {

    @IBOutlet var similarButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

private extension MusicPlayerViewController {
    func configureUI() {
        similarButton.layer.cornerRadius = 15.0
        similarButton.layer.borderWidth = 2.0
        similarButton.layer.borderColor = UIColor.lightGray.cgColor
    }
}
