//
//  ViewExtensions.swift
//  NumberMachine2
//
//  Created by liao on 2021/6/23.
//  Copyright © 2021 liao. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableView: UIView {
}

@IBDesignable
class DesignableLabel: UILabel {
}

extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var rotation: Int {
        get {
            return 0
        } set {
            let radians = (CGFloat.pi * CGFloat(newValue) / CGFloat(180.0))
            self.transform = CGAffineTransform(rotationAngle: radians)
        }
    }
}
