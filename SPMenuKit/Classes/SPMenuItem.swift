//
//  SPMenuItem.swift
//  SPMenuKit
//
//  Created by Qingpu Shi on 2019/7/11.
//

import UIKit

private var isSwizzled = false

@objcMembers
public class SPMenuItem: UIMenuItem {
    static var images = [String: UIImage]()
    static let uuid = UUID().uuidString

    public final class func install() {
        guard !isSwizzled else {
            return
        }

        isSwizzled = true

        swizzle(NSString.self,
                originalSelector: #selector(NSString.self.size(withAttributes:)),
                swizzledSelector: #selector(NSString.self.swizzled_size(withAttributes:)))

        swizzle(UILabel.self,
                originalSelector: #selector(UILabel.self.layoutSubviews),
                swizzledSelector: #selector(UILabel.self.swizzled_layoutSubviews))

        swizzle(UILabel.self,
                originalSelector: #selector(UILabel.self.drawText(in:)),
                swizzledSelector: #selector(UILabel.self.swizzled_drawText(in:)))

        swizzle(UILabel.self,
                originalSelector: #selector(setter: UILabel.self.frame),
                swizzledSelector: #selector(UILabel.self.swizzled_setFrame(_:)))
    }

    private final class func swizzle(_ cls: AnyClass?, originalSelector: Selector, swizzledSelector: Selector) {
        if let originalMethod = class_getInstanceMethod(cls, originalSelector),
            let swizzledMethod = class_getInstanceMethod(cls, swizzledSelector) {
            if class_addMethod(cls,
                               originalSelector,
                               method_getImplementation(swizzledMethod),
                               method_getTypeEncoding(swizzledMethod)) {
                class_replaceMethod(cls,
                                    swizzledSelector,
                                    method_getImplementation(originalMethod),
                                    method_getTypeEncoding(originalMethod))
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod)
            }
        }
    }

    public convenience init(title: String, image: UIImage, action: Selector) {
        let titleWithUUID = title + SPMenuItem.uuid
        SPMenuItem.images[titleWithUUID] = image

        self.init(title: titleWithUUID, action: action)
    }
}
