//
//  NewlyCoinedWordViewController.swift
//  NewlyCoinedWord
//
//  Created by 박태현 on 2023/07/20.
//

import UIKit

final class NewlyCoinedWordViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchResultLabel: UILabel!
    @IBOutlet var newWordButtonCollection: [UIButton]!

    // MARK: - Properties

    private var data: [NewlyCoinedWord] = []
    private var currentlyShownData: [NewlyCoinedWord] = []

    // MARK: - View Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureData()
    }

    // 다크모드 대응을 위한 로직
    // trait이 업데이트되는 시점에 dynamicColor의 resolved color를 cgColor로써 적용
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(#function)
        searchTextField.layer.borderColor = UIColor.customBlackWhite?.cgColor
        newWordButtonCollection.forEach {
            $0.layer.borderColor = UIColor.customBlackWhite?.cgColor
        }
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        print(#function)
    }

    // MARK: - IBActions

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

        // 키보드가 호출된 상태에서 wordButton을 탭할 경우, 키보드가 내려가지 않으므로 하단 코드 추가
        view.endEditing(true)
    }
}

// MARK: - Methods

private extension NewlyCoinedWordViewController {
    func configureUI() {
        searchTextField.addLeftPadding(16.0)
        searchTextField.layer.borderWidth = 4.0

        newWordButtonCollection.forEach {
            $0.layer.cornerRadius = 5.0
            $0.layer.borderWidth = 2.0
            $0.contentEdgeInsets = .init(top: 4, left: 8, bottom: 4, right: 8)
        }
    }

    func configureData() {
        data = NewlyCoinedWord.allCases
        configureButtonData()
    }

    func configureButtonData() {
        // newlyCoinedWordList의 열거형 배열을 shuffled 진행
        let newlyCoinedWordList = data.shuffled()

        // newWordButton의 tag를 인덱스로 활용해서 순차적으로 setTitle 수행
        // 현재 버튼에 표시된 신조어들은 따로 배열로 저장
        newWordButtonCollection.forEach {
            let newlyCoinedWord = newlyCoinedWordList[$0.tag]
            $0.setTitle(newlyCoinedWord.rawValue, for: .normal)
            currentlyShownData.append(newlyCoinedWord)
        }
    }

    func presentAlert(title: String, message: String, style: UIAlertController.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let alertAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
}

// MARK: - 신조어 검색과 버튼 업데이트 로직

private extension NewlyCoinedWordViewController {

    /// 신조어 버튼에 포함된 키워드라면, 해당 버튼의 타이틀을 새로운 신조어로 업데이트 합니다.
    /// - Parameter keyword: 현재 선택된 신조어 문자열
    func updateButtonTitle(of keyword: String) {
        guard let newlyCoinedWord = NewlyCoinedWord(rawValue: keyword),
              let currentIndex = currentlyShownData.firstIndex(of: newlyCoinedWord),
              let button = newWordButtonCollection.filter({ $0.tag == currentIndex }).first
        else { return }

        // Set의 subtracting을 활용한, 현재 보여지지 않는 신조어 랜덤으로 뽑아오기
        if let newWordItem = Set(data).subtracting(Set(currentlyShownData)).randomElement() {
            button.setTitle(newWordItem.rawValue, for: .normal)

            // 새로운 신조어로 대체했으므로, 기존의 신조어는 currentlyShownData에서 제거
            currentlyShownData.remove(at: currentIndex)

            // 새로운 신조어로 대체했으므로, currentlyShownData에 추가
            // 단, 버튼의 tag를 인덱스로 써서 배열에 접근하므로 제거한 인덱스에 새로운 신조어 insert하기
            currentlyShownData.insert(newWordItem, at: currentIndex)
        }
    }

    /// 신조어를 검색합니다
    /// - Parameter keyword: 검색할 신조어 문자열
    func searchNewlyCoinedWord(_ keyword: String) {
        guard !keyword.isEmpty && keyword.count > 1 else {
            presentAlert(title: "", message: "최소 두글자 이상 입력하세요", style: .alert)
            return
        }
        guard let result = NewlyCoinedWord(rawValue: keyword) else {
            presentAlert(title: "", message: "해당하는 신조어에 대한 정보가 없어요", style: .alert)
            return
        }
        searchResultLabel.text = result.description
        updateButtonTitle(of: keyword)
    }
}
