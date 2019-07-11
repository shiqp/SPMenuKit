//
//  SPMenuItem.swift
//  SPMenuKit
//
//  Created by Qingpu Shi on 2019/7/11.
//

import UIKit

public class SPMenuItem: UIMenuItem {
    public convenience init(imageName: String, action: Selector) {
        self.init(title: imageName, action: action)
    }
}
