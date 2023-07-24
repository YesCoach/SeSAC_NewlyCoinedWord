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
    @IBOutlet var homeCardView: [UIView]!
    @IBOutlet var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureNavigationBar()
        scrollView.delegate = self
    }
}

private extension BaeminViewController {
    func configureUI() {
        searchTextField.layer.cornerRadius = 5.0
        searchTextField.addLeftImage(UIImage(systemName: "magnifyingglass")!)

        topView.clipsToBounds = true
        topView.layer.cornerRadius = 10
        topView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]

        homeCardView.forEach {
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10.0
        }
    }

    func configureNavigationBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = .systemMint

        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}

// MARK: - UIScrollViewDelegate 구현부

extension BaeminViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // scrollView의 bottom Bounce를 무시하는 로직
        scrollView.bounces = scrollView.contentOffset.y < 20
    }
}
