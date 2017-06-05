//
//  Appearance.swift
//  Depressed?
//
//  Created by Christian Lobach on 02.06.17.
//  Copyright © 2017 Christian Lobach. All rights reserved.
//

import Foundation
import UIKit

struct Appearance {
    static let lightPurple = #colorLiteral(red: 0.5223392248, green: 0.3648412228, blue: 0.7985767722, alpha: 1)
    static let darkPurple = #colorLiteral(red: 0.4154375196, green: 0.2874074876, blue: 0.6436447501, alpha: 1)

    static func setUp() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        appDelegate.window?.tintColor = darkPurple
        UINavigationBar.appearance().titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.white
        ]

    }

}
