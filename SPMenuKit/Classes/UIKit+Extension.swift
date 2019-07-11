//
//  String+Extension.swift
//  SPMenuKit
//
//  Created by Qingpu Shi on 2019/7/11.
//

import UIKit

extension NSString {
    @objc func swizzled_size(withAttributes attrs: [NSAttributedString.Key : Any]? = nil) -> CGSize {
        if let image = SPMenuItem.images[self as String] {
            return image.size
        }
        return swizzled_size(withAttributes: attrs)
    }
}

extension UILabel {
    @objc func swizzled_layoutSubviews() {
        self.swizzled_layoutSubviews()
        if let text = self.text, let image = SPMenuItem.images[text] {
            let imageView = UIImageView(image: image.withRenderingMode(.alwaysTemplate))
            imageView.tintColor = .white
            self.addSubview(imageView)
        }
    }

    @objc func swizzled_drawText(in rect: CGRect) {
        if let text = self.text, let _ = SPMenuItem.images[text] {
            return
        }
        self.swizzled_drawText(in: rect)
    }

    @objc func swizzled_setFrame(_ frame: CGRect) {
        var frame = frame
        if let text = self.text, let image = SPMenuItem.images[text] {
            let origin = CGPoint(x: frame.midX - image.size.width / 2,
                                 y: frame.midY - image.size.height / 2)
            frame = CGRect(origin: origin, size: image.size)
        }

        self.swizzled_setFrame(frame)
    }
}
