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
        print(sender.date)
    }

    func configureUI() {
        configureDatePicker()
        background100ImageView.backgroundColor = .green
        date100Label.backgroundColor = .green
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
