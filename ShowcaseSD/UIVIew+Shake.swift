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
    
    // TODO:
    func moveHorizontally(){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 1.0
        animation.repeatCount = Float.infinity
        animation.autoreverses = true
        animation.fromValue = NSValue(CGPoint: CGPointMake(self.center.x - 50, self.center.y))
        animation.toValue = NSValue(CGPoint: CGPointMake(self.center.x + 50, self.center.y))
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
    
    func rotateToDegrees(degrees: CGFloat) {
        
        let radians = degreesToRadians(degrees)
        
        let
        animation:CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation")
        animation.duration = 0.001
        animation.repeatCount = 1
        animation.fillMode = kCAFillModeForwards;
        animation.removedOnCompletion = false;
        animation.fromValue = CGFloat(0.0)
        animation.toValue = CGFloat(radians)
        self.layer.addAnimation(animation, forKey: nil)
        
    }
    
    func degreesToRadians(degrees: CGFloat) -> CGFloat{
        return degrees * CGFloat(M_PI) / 180
    }
}
