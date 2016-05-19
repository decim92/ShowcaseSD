//
//  UIVIew+Shake.swift
//  ShowcaseSD
//
//  Created by Sundevs Puerto Salgar on 5/16/16.
//  Copyright © 2016 Sundevs Puerto Salgar. All rights reserved.
//

import UIKit

extension UIView {
    func shakeFromDown() {
        
        let
        shake:CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation")
        shake.duration = 0.5
        shake.repeatCount = Float.infinity
        shake.autoreverses = true
        
        shake.fromValue = CGFloat(-0.3)
        shake.toValue = CGFloat(0.3)
//        self.layer.shouldRasterize = true
        self.layer.addAnimation(shake, forKey: nil)
        
    }
    
    func shakeFromUp() {
        
        let
        shake:CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation")
        shake.duration = 0.5
        shake.repeatCount = Float.infinity
        shake.autoreverses = true
        shake.beginTime = 0.5
        
        shake.fromValue = CGFloat(-0.3)
        shake.toValue = CGFloat(0.3)
        //        self.layer.shouldRasterize = true
        self.layer.addAnimation(shake, forKey: nil)
        
    }
    
    func moveUp(){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.3
        animation.repeatCount = Float.infinity
        animation.autoreverses = true
        animation.fromValue = NSValue(CGPoint: CGPointMake(self.center.x, self.center.y))
        animation.toValue = NSValue(CGPoint: CGPointMake(self.center.x, self.center.y - 5))
        self.layer.addAnimation(animation, forKey: "position")
    }
    
    func bloat() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.toValue = NSNumber(float: 0.8)
        animation.duration = 0.3
        animation.repeatCount = Float.infinity
        animation.autoreverses = true
        self.layer.addAnimation(animation, forKey: nil)
    }
}
