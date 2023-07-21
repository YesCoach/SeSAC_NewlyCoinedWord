//
//  NewlyCoinedWordViewController.swift
//  NewlyCoinedWord
//
//  Created by 박태현 on 2023/07/20.
//

import UIKit

class NewlyCoinedWordViewController: UIViewController {

    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchResultLabel: UILabel!

    var data: [String: String] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureData()
        searchTextField.delegate = self
    }

    // For Dynamic Color with CGColor
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(#function)
        searchTextField.layer.borderColor = UIColor.customBlackWhite?.cgColor
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        print(#function)
    }

    @IBAction func didBackgroundTouched(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    @IBAction func didSearchButtonTouched(_ sender: UIButton) {
        view.endEditing(true)
        searchNewlyCoinedWord(searchTextField.text!)
    }
}

private extension NewlyCoinedWordViewController {
    func configureUI() {
        searchTextField.addLeftPadding(16.0)
        searchTextField.layer.borderWidth = 4.0
    }

    func configureData() {
        data = [
            "알잘딱깔센": "알아서 잘 딱 깔끔하게 센스있게",
            "햄최몇": "햄버거 최대 몇개?",
            "오운완": "오늘 운동 완료",
            "반모": "반역모의",
            "세최미": "세계 최고 미드라이너"
        ]
    }

    func searchNewlyCoinedWord(_ keyword: String) {
        if let result = data[keyword] {
            searchResultLabel.text = result
        }
    }
}

extension NewlyCoinedWordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        searchNewlyCoinedWord(textField.text!)
        return true
    }
}
