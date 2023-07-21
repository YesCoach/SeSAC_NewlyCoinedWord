//
//  ProfileViewController.swift
//  NewlyCoinedWord
//
//  Created by 박태현 on 2023/07/21.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var bottomButton: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

private extension ProfileViewController {
    func configureUI() {
        imageView.layer.cornerRadius = 10.0
    }
}
