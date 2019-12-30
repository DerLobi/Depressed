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
        layer.shadowColor = Appearance.elephant.cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 2.0
        layer.shadowOffset = CGSize(width: 0, height: 1)

        backgroundColor = .white
        tintColor = Appearance.endeavour
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
