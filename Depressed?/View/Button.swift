//
//  Button.swift
//  Depressed?
//
//  Created by Christian Lobach on 21.05.17.
//  Copyright © 2017 Christian Lobach. All rights reserved.
//

import UIKit
import ResearchKit

@IBDesignable
class Button: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()

        setUpAppearance()

        NotificationCenter.default.addObserver(self, selector: #selector(updateFontSize), name: UIContentSizeCategory.didChangeNotification, object: nil)
    }

    override var intrinsicContentSize: CGSize {
        let originalSize = super.intrinsicContentSize
        return CGSize(width: originalSize.width + 24, height: originalSize.height + 8)
    }

    override func prepareForInterfaceBuilder() {
        setUpAppearance()
    }

    private func setUpAppearance() {
        layer.cornerRadius = 10.0
        backgroundColor = .white
        tintColor = Appearance.darkPurple
        updateFontSize()
    }

    @objc private func updateFontSize() {
        titleLabel?.font = buttonFont()
    }

    private func buttonFont() -> UIFont {
        let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .headline)
        let size = descriptor.pointSize + 1
        return UIFont.boldSystemFont(ofSize: size)
    }

}
