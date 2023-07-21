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
    @IBOutlet var newWordButton: [UIButton]!

    private var data: [String: String] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureData()
    }

/*
    func getRandomWord() -> String {
        let random = ["고래밥", "칙촉", "카스타드", "메로나", "월드콘"]
        let result = random.randomElement()!
        print(result)

        return result
    }
*/

    // For Dynamic Color with CGColor
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(#function)
        searchTextField.layer.borderColor = UIColor.customBlackWhite?.cgColor
        newWordButton.forEach {
            $0.layer.borderColor = UIColor.customBlackWhite?.cgColor
        }
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

    @IBAction func didKeyboardReturnEntered(_ sender: UITextField) {
        searchNewlyCoinedWord(sender.text!)
    }

    @IBAction func didWordButtonTouched(_ sender: UIButton) {
        searchTextField.text = sender.currentTitle
        didKeyboardReturnEntered(searchTextField)

        // 키보드가 호출된 상태에서 wordButton을 탭할 경우, 키보드가 내려가지 않음
        view.endEditing(true)
    }
}

private extension NewlyCoinedWordViewController {
    func configureUI() {
        searchTextField.addLeftPadding(16.0)
        searchTextField.layer.borderWidth = 4.0

        newWordButton.forEach {
            $0.layer.cornerRadius = 15.0
            $0.layer.borderWidth = 2.0
        }
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

    /*
        if keyword == "반모" {
            searchResultLabel.text = "반말모드"
        } else if keyword == "세최미" {
            searchResultLabel.text = "세계 최고 미드라이너"
        } else {
            searchResultLabel.text = "찾는 결과가 없습니다."
        }
    */

    /*
        let keyword = keyword.lowercased()
        switch keyword {
        case "반모":
            searchResultLabel.text = "반말모드"
        case "세최미":
            searchResultLabel.text = "세계 최고 미드라이너"
        case "jmt", "JMT":
            searchResultLabel.text = "마시따"
        default:
            searchResultLabel.text = "찾는 결과가 없습니다."
        }
     */

    }
}
