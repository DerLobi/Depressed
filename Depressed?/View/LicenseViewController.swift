//
//  LicenseViewController.swift
//  Depressed?
//
//  Created by Christian Lobach on 04.06.17.
//  Copyright © 2017 Christian Lobach. All rights reserved.
//

import UIKit

class LicenseViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // The license text is already set in Interface Builder, 
        // but on iOS >= 9 the layout is borked unless we set the text again.
        let license = textView.text
        textView.text = ""
        DispatchQueue.main.async {
            self.textView.text = license
        }
    }

}
