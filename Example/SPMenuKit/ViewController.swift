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
        SPMenuItem.install()
    }

    override var canBecomeFirstResponder: Bool {
        return true
    }

    @objc func onMenuItemTapped() {

    }

    @IBAction func showMenu(_ sender: UIButton) {
        let noteItem = SPMenuItem(title: "Note", image: UIImage(named: "note")!, action: #selector(onMenuItemTapped))
        let copyItem = SPMenuItem(title: "Copy", action: #selector(onMenuItemTapped))

        UIMenuController.shared.menuItems = [noteItem, copyItem]
        UIMenuController.shared.setTargetRect(sender.frame, in: self.view)
        UIMenuController.shared.setMenuVisible(true, animated: true)
    }
}

