//
//  ViewController.swift
//  SPMenuKit
//
//  Created by shiqp on 07/11/2019.
//  Copyright (c) 2019 shiqp. All rights reserved.
//

import SPMenuKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override var canBecomeFirstResponder: Bool {
        return true
    }

    @objc func onMenuItemTapped() {

    }

    @IBAction func showMenu(_ sender: UIButton) {
        let menuItem = SPMenuItem(imageName: "Item", action: #selector(onMenuItemTapped))
        UIMenuController.shared.menuItems = [menuItem]
        UIMenuController.shared.setTargetRect(sender.frame, in: self.view)
        UIMenuController.shared.setMenuVisible(true, animated: true)
    }
}

