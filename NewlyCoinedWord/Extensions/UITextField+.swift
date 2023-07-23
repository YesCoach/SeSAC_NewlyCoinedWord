//
//  UITextField+.swift
//  NewlyCoinedWord
//
//  Created by 박태현 on 2023/07/20.
//

import UIKit

extension UITextField {
    func addLeftPadding(_ length: CGFloat) {
        let paddingView = UIView(
            frame: CGRect(x: 0, y: 0, width: length, height: self.frame.height)
        )
        self.leftView = paddingView
        self.leftViewMode = .always
    }

    func addLeftImage(_ image: UIImage) {
        let leftimage = UIImageView(frame: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        leftimage.image = image
        leftimage.tintColor = .systemMint
        self.leftView = leftimage
        self.leftViewMode = .always
    }
}
