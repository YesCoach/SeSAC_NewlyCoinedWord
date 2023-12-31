//
//  DatePickerViewController.swift
//  NewlyCoinedWord
//
//  Created by 박태현 on 2023/07/20.
//

import UIKit

final class DatePickerViewController: UIViewController {

    @IBOutlet var datePicker: UIDatePicker!

    @IBOutlet var background100ImageView: UIImageView!
    @IBOutlet var background200ImageView: UIImageView!
    @IBOutlet var background300ImageView: UIImageView!
    @IBOutlet var background400ImageView: UIImageView!

    @IBOutlet var shadowEffectView: [UIView]!

    @IBOutlet var date100Label: UILabel!
    @IBOutlet var date200Label: UILabel!
    @IBOutlet var date300Label: UILabel!
    @IBOutlet var date400Label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    @IBAction func didDatePickerSelected(_ sender: UIDatePicker) {
        updateBottomCardView(date: sender.date)
    }

    private func configureUI() {
        configureDatePicker()
        configurationBottomCardView()
        if #available(iOS 15.0, *) {
            updateBottomCardView(date: Date.now)
        } else {
            updateBottomCardView(date: datePicker.date)
        }
    }

    private func configureDatePicker() {
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        } else {
            datePicker.preferredDatePickerStyle = .wheels
        }
        datePicker.tintColor = .red
        datePicker.datePickerMode = .date
        datePicker.locale = .init(identifier: "ko_KR")
    }

    private func configurationBottomCardView() {
        [
            background100ImageView, background200ImageView,
            background300ImageView, background400ImageView
        ].forEach {
            guard let imageView = $0 else { return }
            imageView.layer.cornerRadius = 20.0
        }

        // IBOutletCollection 사용
        shadowEffectView.forEach {
            $0.layer.cornerRadius = 20.0
            $0.layer.shadowColor = UIColor.black.cgColor
            $0.layer.shadowOffset = .zero
            $0.layer.shadowRadius = 10.0
            $0.layer.shadowOpacity = 0.5
        }
    }

    private func updateBottomCardView(date: Date) {
        guard let dateAfter100d = Calendar.current.date(byAdding: .day, value: 100, to: date),
              let dateAfter200d = Calendar.current.date(byAdding: .day, value: 200, to: date),
              let dateAfter300d = Calendar.current.date(byAdding: .day, value: 300, to: date),
              let dateAfter400d = Calendar.current.date(byAdding: .day, value: 400, to: date)
        else { return }

        // DateFormatter: 1. 시간대 변경 2. 날짜 포맷 변경
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .init(identifier: "ko_KR")
        dateFormatter.dateFormat = "MM월 dd일, yyyy년"

        date100Label.text = dateFormatter.string(from: dateAfter100d)
        date200Label.text = dateFormatter.string(from: dateAfter200d)
        date300Label.text = dateFormatter.string(from: dateAfter300d)
        date400Label.text = dateFormatter.string(from: dateAfter400d)
    }
}
