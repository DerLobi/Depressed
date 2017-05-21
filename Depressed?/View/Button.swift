//
//  Button.swift
//  Depressed?
//
//  Created by Christian Lobach on 21.05.17.
//  Copyright © 2017 Christian Lobach. All rights reserved.
//

import UIKit
import ResearchKit

class Button: ORKBorderedButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        tintColor = UIColor(red:0.34, green:0.20, blue:0.58, alpha:1.00)
        init_ORKTextButton()
    }

}
