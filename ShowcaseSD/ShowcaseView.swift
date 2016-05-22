//
//  ShowcaseView.swift
//  ShowcaseSD
//
//  Created by Sundevs Puerto Salgar on 5/15/16.
//  Copyright © 2016 Sundevs Puerto Salgar. All rights reserved.
//

import UIKit

//enum STATE: Int {
//    case Selected
//    case Unselected
//}

public enum REGION: Int {
    case TOP = 0
    case LEFT = 1
    case BOTTOM = 2
    case RIGHT = 3
    
    static func regionFromInt(region: Int) -> REGION {
        switch (region) {
        case 0:
            return .TOP
        case 1:
            return .LEFT
        case 2:
            return .BOTTOM
        case 3:
            return .RIGHT
        default:
            return .TOP
        }
    }
}


class ShowcaseView: UIView {
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    // MARK: colors
    
    internal var highlightColor: UIColor = ShowcaseView.colorHexFromString("#F8EBD9")
    
    // MARK: state
    
    private var containerView : UIView = (UIApplication.sharedApplication().delegate!.window!)!
    // MARK: focus definition
    
    var imgViewFocus = UIImageView()
    private var region: REGION?
    internal let minRadius: CGFloat = 25
    let highlightThickness:CGFloat = 0.6
    private var showcaseRect: CGRect?
    
    var originX:CGFloat?
    var originY:CGFloat?
    var newRadius:CGFloat?
    
    var arrows = [UIImageView]()
    
    // MARK: initializers

    internal init() {
        super.init(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
        
        // Setting overlays's traits


//        self.backgroundColor = UIColor.clearColor().colorWithAlphaComponent(1)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSizeMake(0.0, 0.0)
        self.hidden = true
        
//        // Define the skip button's image, target
//        btnSkip.frame = CGRectMake(UIScreen.mainScreen().bounds.width / 2 - imgSkip!.size.width / 2, UIScreen.mainScreen().bounds.height - 20 - imgSkip!.size.height, imgSkip!.size.width, imgSkip!.size.height)
//        btnSkip.setImage(imgSkip, forState: .Normal)
//        btnSkip.adjustsImageWhenHighlighted = false
//        btnSkip.translatesAutoresizingMaskIntoConstraints = false
//        btnSkip.addTarget(self, action: #selector(ShowcaseView.onSkipButtonTapped), forControlEvents: .TouchDown)
//        
//        // Define the previous button's image, target
//        
//        btnPrevious.setImage(imgPrevious, forState: .Normal)
//        btnPrevious.adjustsImageWhenHighlighted = false
//        btnPrevious.translatesAutoresizingMaskIntoConstraints = false
//        btnPrevious.addTarget(self, action: #selector(ShowcaseView.onPreviousButtonTapped(_:)), forControlEvents: .TouchDown)
//        
//        // Define the next button's image, target
//        
//        btnNext.setImage(imgNext, forState: .Normal)
//        btnNext.adjustsImageWhenHighlighted = false
//        btnNext.translatesAutoresizingMaskIntoConstraints = false
//        btnNext.addTarget(self, action: #selector(ShowcaseView.onNextButtonTapped(_:)), forControlEvents: .TouchDown)
//        
//        
//        
//        // Define an UIImageView as component below btnPrevious (used to add an image as text to the button)
//        
//        //        imgViewBack  = UIImageView(frame:CGRectMake(0, 0, 80, 30));
//        imgViewBack.image = UIImage(named: "back")
//        imgViewBack.contentMode = UIViewContentMode.ScaleAspectFit
//        imgViewBack.translatesAutoresizingMaskIntoConstraints = false
//        
//        
//        // Define an UIImageView as component below btnNext (used to add an image as text to the button)
//        
//        //        imgViewGoOn = UIImageView(frame:CGRectMake(0, 0, 80, 30));
//        imgViewGoOn.image = UIImage(named: "goOn")
//        imgViewGoOn.contentMode = UIViewContentMode.ScaleAspectFit
//        imgViewGoOn.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
    required internal init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    internal convenience init(containerView: UIView) {
        self.init()

        self.showcaseRect = containerView.frame
        self.containerView = containerView

    }
    
    override internal func layoutSubviews() {
        
//        // Get the superview's layout
//        
//        let margins = self.layoutMarginsGuide
//        
//        let container = UILayoutGuide()
//        self.addLayoutGuide(container)
//        
//        // Generating the initial constraints
//        
//        btnPrevious.leadingAnchor.constraintEqualToAnchor(container.leadingAnchor).active = true
//        btnPrevious.widthAnchor.constraintEqualToAnchor(btnSkip.widthAnchor).active = true
//        btnPrevious.bottomAnchor.constraintEqualToAnchor(imgViewBack.topAnchor).active = true
//        
//        btnSkip.leadingAnchor.constraintEqualToAnchor(btnPrevious.trailingAnchor).active = true
//        btnSkip.trailingAnchor.constraintEqualToAnchor(btnNext.leadingAnchor).active = true
//        btnSkip.centerXAnchor.constraintEqualToAnchor(container.centerXAnchor).active = true
//        btnSkip.centerYAnchor.constraintEqualToAnchor(btnPrevious.bottomAnchor).active = true
//        
//        btnNext.trailingAnchor.constraintEqualToAnchor(container.trailingAnchor).active = true
//        btnNext.bottomAnchor.constraintEqualToAnchor(btnPrevious.bottomAnchor).active = true
//        btnNext.widthAnchor.constraintEqualToAnchor(btnPrevious.widthAnchor).active = true
//        
//        imgViewBack.centerXAnchor.constraintEqualToAnchor(btnPrevious.centerXAnchor).active = true
//        imgViewBack.bottomAnchor.constraintEqualToAnchor(margins.bottomAnchor, constant: -20).active = true
//        imgViewBack.leadingAnchor.constraintEqualToAnchor(btnPrevious.leadingAnchor).active = true
//        imgViewBack.trailingAnchor.constraintEqualToAnchor(btnPrevious.trailingAnchor).active = true
//        
//        imgViewGoOn.centerXAnchor.constraintEqualToAnchor(btnNext.centerXAnchor).active = true
//        imgViewGoOn.bottomAnchor.constraintEqualToAnchor(imgViewBack.bottomAnchor).active = true
//        imgViewGoOn.leadingAnchor.constraintEqualToAnchor(btnNext.leadingAnchor).active = true
//        imgViewGoOn.trailingAnchor.constraintEqualToAnchor(btnNext.trailingAnchor).active = true
//        
//        
//        container.centerYAnchor.constraintEqualToAnchor(margins.centerYAnchor).active = true
//        container.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor).active = true
//        container.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor).active = true
        
        
    }
    
    
    /**
        Set position of the showcaseView to a UIView
        
        - Parameters:
            - aView: The view that will take the focus
     */
    func setFocusPositionInView(aView:UIView) {
        
        showcaseRect = aView.frame
        setupBackground()
//        calculateRegion()
        
        addSubview(imgViewFocus)
//        addSubview(btnSkip)
//        addSubview(btnPrevious)
//        addSubview(btnNext)
//        addSubview(imgViewBack)
//        addSubview(imgViewGoOn)

    }
    
    /**
        Add UIImages representing arrows or step number in a certain relative position to the showcaseView.
     
        - Parameters:
            - imgArrow: graphical representation of an arrow
            - arrowPosition: one of the four cardinal points
            - offsetX: the quantity of displacement in X axis
            - offsetY: the quantity of displacement in Y axis
     */
    func addArrowToFocusInPosition(imgArrow:UIImageView, arrowPosition: REGION, offsetX: CGFloat?, offsetY: CGFloat?) {
        
        self.arrows += [imgArrow]
        
//        imgArrow.layer.shouldRasterize = true
        
        imgArrow.translatesAutoresizingMaskIntoConstraints = true
        
        let offsetX = offsetX ?? 0
        let offsetY = offsetY ?? 0
        
        let focusMidTop = CGPoint(x: self.originX! + self.newRadius!, y: self.originY!)
        let focusMidRight = CGPoint(x: self.originX! + self.newRadius! * 2, y: self.originY! + self.newRadius!)
        let focusMidBottom = CGPoint(x: self.originX! + self.newRadius!, y: self.newRadius! * 2 + self.originY!)
        let focusMidLeft = CGPoint(x: self.originX!, y: self.originY! + self.newRadius!)
        
        switch arrowPosition {
        case .TOP:
            print("Added top arrow")
            imgArrow.frame = CGRectMake(offsetX + focusMidTop.x - imgArrow.frame.width / 2, offsetY + self.originY! - imgArrow.frame.width, imgArrow.frame.width, imgArrow.frame.height)
            break
        case .RIGHT:
            print("Added right arrow")
            imgArrow.frame = CGRectMake(offsetX + focusMidRight.x, offsetY + focusMidRight.y - imgArrow.frame.height / 2, imgArrow.frame.width, imgArrow.frame.height)
            
            break
        case .BOTTOM:
            print("Added bottom arrow")
            imgArrow.frame = CGRectMake(offsetX + focusMidBottom.x - imgArrow.frame.width / 2, offsetY + focusMidBottom.y, imgArrow.frame.width, imgArrow.frame.height)
            
            break
        case .LEFT:
            print("Added left arrow")
            imgArrow.frame = CGRectMake(offsetX + focusMidLeft.x - imgArrow.frame.width, offsetY + focusMidLeft.y - imgArrow.frame.height / 2, imgArrow.frame.width, imgArrow.frame.height)
            
            break
        }
        imgArrow.alpha = 0.0
        self.addSubview(imgArrow)
        
    }
    
    /**
     Method that draws an imageView filling the whole screen with a hole in it which represents a focus in a view
     */
    private func setupBackground() {
        UIGraphicsBeginImageContextWithOptions(UIScreen.mainScreen().bounds.size, false, UIScreen.mainScreen().scale)
        let context: CGContextRef? = UIGraphicsGetCurrentContext()
//        CGContextSetFillColorWithColor(context, self.backgroundColor?.CGColor)
        CGContextFillRect(context, containerView.bounds)
        
        if let showcaseRect = self.showcaseRect{
            let showcaseRectRadius = showcaseRect.size.width / 2.0
            let centerX = showcaseRect.origin.x + showcaseRectRadius
            let centerY = showcaseRect.origin.y + showcaseRect.size.height / 2.0
                let center = CGPointMake(centerX, centerY)
            
            var radius:CGFloat
            if minRadius >= (showcaseRect.width / 2.0){
                radius = minRadius
            }else{
                radius = (showcaseRect.width / 2.0)
            }
            
            self.originX = center.x - radius
            self.originY = center.y - radius
            self.newRadius = radius
        
                // Draw highlight
                CGContextSetLineWidth(context, highlightThickness)
//                CGContextSetShadowWithColor(context, CGSizeZero, 30, self.highlightColor.CGColor)
                CGContextSetFillColorWithColor(context, self.backgroundColor?.CGColor)
                CGContextSetStrokeColorWithColor(context, self.highlightColor.CGColor)
                // distance of highlight
                CGContextAddArc(context, center.x, center.y, CGFloat(radius + 7), 0, CGFloat(2 * M_PI), 0)
                CGContextDrawPath(context, .FillStroke)
                CGContextAddArc(context, center.x, center.y, CGFloat(radius), 0, CGFloat(2 * M_PI), 0)
                CGContextDrawPath(context, .FillStroke)
            
                // Clear circle
                CGContextSetFillColorWithColor(context, ShowcaseView.colorHexFromString("FFD140").CGColor)
                CGContextSetBlendMode(context, .Normal)
                CGContextAddArc(context, center.x, center.y, CGFloat(radius), 0, CGFloat(2 * M_PI), 0)
                CGContextDrawPath(context, .Fill)
                CGContextSetBlendMode(context, .Normal)
            
        }
        imgViewFocus = UIImageView(image: UIGraphicsGetImageFromCurrentImageContext())
        imgViewFocus.translatesAutoresizingMaskIntoConstraints = true
        UIGraphicsEndImageContext()
        imgViewFocus.alpha = 0.7
        addSubview(imgViewFocus)

    }
    
    /**
     Show self in a view as parameter.
     
     - Parameters:
     - aView: Take the reference to a view (it's parent view) to place itself in the view
     - animated: Indicates whether it has animation or not
     */
    func showInView(aView: UIView!, animated: Bool)
    {
        aView.addSubview(self)
        if animated
        {
            self.showAnimate()
        }
    }
    
    /**
     Define the form of the overlay's animation.
     */
    func showAnimate()
    {
        self.transform = CGAffineTransformMakeScale(1.3, 1.3)
        self.alpha = 0.0;
        UIView.animateWithDuration(0.25, animations: {
            self.alpha = 1.0
            self.transform = CGAffineTransformMakeScale(1.0, 1.0)
        });
    }
    
    /**
     Define how the overlay dissapears from the screen.
     */
    func removeAnimate()
    {
        UIView.animateWithDuration(0.25, animations: {
            self.transform = CGAffineTransformMakeScale(1.3, 1.3)
            self.alpha = 0.0;
            }, completion:{(finished : Bool)  in
                if (finished)
                {
                    self.removeFromSuperview()
                }
        });
    }
    
    func showSubViewsWithAnimation(){
        for (index, subview) in subviews.enumerate() {
            if index == 0 {
            } else if index == 1 {
                subview.alpha = 1.0
            } else {
                UIView.animateWithDuration(0.5, delay: 0.5, options:  [], animations: {
                        subview.alpha = 1.0
                    }, completion: nil)
            }
        }
    }
    
    func hideSubViews(){
        for (index, subview) in subviews.enumerate() {
            if index == 0 {
            } else {
                subview.alpha = 0.0
            }
        }
    }
    

    internal static func colorHexFromString(colorString: String) -> UIColor {
        let hex = colorString.stringByTrimmingCharactersInSet(NSCharacterSet.alphanumericCharacterSet().invertedSet)
        var int = UInt32()
        NSScanner(string: hex).scanHexInt(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            return UIColor.clearColor()
        }
        return UIColor(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }


}
