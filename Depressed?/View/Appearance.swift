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
    static let endeavour = UIColor(named: "Endeavour")!
    static let elephant = UIColor(named: "Elephant")!

    static func setUp() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        appDelegate.window?.tintColor = Appearance.endeavour
    }

}
