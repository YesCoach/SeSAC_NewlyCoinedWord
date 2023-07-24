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
    private var buttonTitle: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureData()
    }

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
            $0.layer.cornerRadius = 5.0
            $0.layer.borderWidth = 2.0
            $0.contentEdgeInsets = .init(top: 4, left: 8, bottom: 4, right: 8)
        }
    }
    func configureData() {
        data = [
            "알잘딱깔센": "알아서 잘 딱 깔끔하게 센스있게",
            "햄최몇": "햄버거 최대 몇개?",
            "오운완": "오늘 운동 완료",
            "반모": "반역모의",
            "세최미": "세계 최고 미드라이너",
            "사바사": "사람 바이 사람"
        ]
        configureButtonData()
    }

    func configureButtonData() {
        let keys = Array(data.keys).shuffled()

        newWordButton.forEach {
            $0.setTitle(keys[$0.tag], for: .normal)
            buttonTitle.append(keys[$0.tag])
        }
    }

    // 현재 노출된 것 이외의 신조어를 버튼의 타이틀로 설정합니다
    func changeButtonTitle(button: UIButton) {
        if let currentTitle = button.currentTitle,
           let currentIndex = buttonTitle.firstIndex(of: currentTitle),
           let newTitle = Set(data.keys).subtracting(Set(buttonTitle)).randomElement() {
            button.setTitle(newTitle, for: .normal)
            buttonTitle.remove(at: currentIndex)
            buttonTitle.insert(newTitle, at: currentIndex)
        }
    }

    func searchNewlyCoinedWord(_ keyword: String) {
        guard !keyword.isEmpty && keyword.count > 1 else {
            presentAlert(title: "", message: "최소 두글자 이상 입력하세요", style: .alert)
            return
        }
        guard let result = data[keyword] else {
            presentAlert(title: "", message: "해당하는 신조어에 대한 정보가 없어요", style: .alert)
            return
        }
        searchResultLabel.text = result

        if let index = buttonTitle.firstIndex(of: keyword),
           let button = newWordButton.filter { $0.tag == index }.first {
               changeButtonTitle(button: button)
        }
    }

    func presentAlert(title: String, message: String, style: UIAlertController.Style) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: style
        )
        let alertAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
}
