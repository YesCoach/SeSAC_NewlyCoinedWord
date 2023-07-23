//
//  BaeminViewController.swift
//  NewlyCoinedWord
//
//  Created by 박태현 on 2023/07/23.
//

import UIKit

class BaeminViewController: UIViewController {

    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var topView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNavigationBar()
    }
}

private extension BaeminViewController {
    func configureUI() {
        searchTextField.layer.cornerRadius = 5.0
        searchTextField.addLeftImage(UIImage(systemName: "magnifyingglass")!)

        topView.clipsToBounds = true
        topView.layer.cornerRadius = 10
        topView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }

    func configureNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .systemMint
        navigationController?.navigationBar.tintColor = .white
    }
}
