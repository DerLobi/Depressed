//
//  InfoViewController.swift
//  Depressed?
//
//  Created by Christian Lobach on 06/11/15.
//  Copyright © 2015 Christian Lobach. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBAction func dismiss(sender: AnyObject) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }

}
