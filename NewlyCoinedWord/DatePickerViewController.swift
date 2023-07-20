//
//  DatePickerViewController.swift
//  NewlyCoinedWord
//
//  Created by 박태현 on 2023/07/20.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet var datePicker: UIDatePicker!

    @IBOutlet var background100ImageView: UIImageView!
    @IBOutlet var date100Label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        testViewProperty()
    }

    @IBAction func didDatePickerSelected(_ sender: UIDatePicker) {
        // DateFormatter: 1. 시간대 변경 2. 날짜 포맷 변경
        // +100일 뒤
        guard let result = Calendar.current.date(byAdding: .day, value: 100, to: sender.date)
        else { return }

        let dateFormatter = DateFormatter()
        dateFormatter.locale = .init(identifier: "ko_KR")
        dateFormatter.dateFormat = "MM월 dd일, yyyy년"

        date100Label.text = dateFormatter.string(from: result)
    }

    func configureUI() {
        configureDatePicker()
        background100ImageView.backgroundColor = .green
        date100Label.backgroundColor = .green
        date100Label.adjustsFontSizeToFitWidth = true
    }

    func configureDatePicker() {
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        } else {
            datePicker.preferredDatePickerStyle = .wheels
        }
        datePicker.tintColor = .red
        datePicker.datePickerMode = .dateAndTime
        datePicker.locale = .init(identifier: "ko_KR")
    }

    func testViewProperty() {
        background100ImageView.layer.cornerRadius = 20.0
        background100ImageView.layer.shadowColor = UIColor.black.cgColor
        background100ImageView.layer.shadowOffset = .zero
        background100ImageView.layer.shadowRadius = 10.0
        background100ImageView.layer.shadowOpacity = 0.5
        background100ImageView.clipsToBounds = false

        date100Label.layer.cornerRadius = 20.0
        date100Label.clipsToBounds = true
        //        date100Label.layer.masksToBounds = true
    }
}
