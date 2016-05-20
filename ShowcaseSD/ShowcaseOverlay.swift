//
//  ShowcaseOverlay.swift
//  ShowcaseSD
//
//  Created by Sundevs Puerto Salgar on 5/12/16.
//  Copyright © 2016 Sundevs Puerto Salgar. All rights reserved.
//

import UIKit

public class ShowcaseOverlay: UIView {
    
    // MARK: arrays

    var showcaseViewArray = [ShowcaseView]()
    var rotationDegreesArray = [CGFloat]()
    
    // MARK: buttons definition
    
    let btnPrevious = UIButton()
    let btnNext = UIButton()
    let btnSkip = UIButton()
    
    // MARK: icons definition
    
    let imgPrevious = UIImage(named: "btn_previous_arrow")
    let imgNext = UIImage(named: "btn_next_arrow")
    let imgSkip = UIImage(named: "btn_skip")
    
    // MARK: images
    
    var imgViewBack = UIImageView()
    var imgViewGoOn = UIImageView()
    
    // MARK: hand definition
    
    var imgHand = UIImage(named: "hand")
    var imgViewHand = UIImageView()
    
    // MARK: initializers
    
    public init() {
        // Self will fill all the screen size
        super.init(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
        
        // Setting overlays's traits
        
        self.backgroundColor = UIColor.clearColor()
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSizeMake(0.0, 0.0)
        
        // Define the skip button's image, target and add it to the view
        
        btnSkip.frame = CGRectMake(UIScreen.mainScreen().bounds.width / 2 - imgSkip!.size.width / 2, UIScreen.mainScreen().bounds.height - 20 - imgSkip!.size.height, imgSkip!.size.width, imgSkip!.size.height)
        btnSkip.setImage(imgSkip, forState: .Normal)
        btnSkip.adjustsImageWhenHighlighted = false
        btnSkip.translatesAutoresizingMaskIntoConstraints = false
        btnSkip.addTarget(self, action: #selector(ShowcaseOverlay.onSkipButtonTapped), forControlEvents: .TouchDown)
        addSubview(btnSkip)
        
        // Define the previous button's image, target and add it to the view
        
        btnPrevious.setImage(imgPrevious, forState: .Normal)
        btnPrevious.adjustsImageWhenHighlighted = false
        btnPrevious.translatesAutoresizingMaskIntoConstraints = false
        btnPrevious.addTarget(self, action: #selector(ShowcaseOverlay.onPreviousButtonTapped(_:)), forControlEvents: .TouchDown)
        addSubview(btnPrevious)
        
        // Define the next button's image, target and add it to the view
        
        btnNext.setImage(imgNext, forState: .Normal)
        btnNext.adjustsImageWhenHighlighted = false
        btnNext.translatesAutoresizingMaskIntoConstraints = false
        btnNext.addTarget(self, action: #selector(ShowcaseOverlay.onNextButtonTapped(_:)), forControlEvents: .TouchDown)
        addSubview(btnNext)
        
       
        // Define an UIImageView as component below btnPrevious (used to add an image as text to the button)
        
//        imgViewBack  = UIImageView(frame:CGRectMake(0, 0, 80, 30));
        imgViewBack.image = UIImage(named: "back")
        imgViewBack.contentMode = UIViewContentMode.ScaleAspectFit
        imgViewBack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imgViewBack)
        
        // Define an UIImageView as component below btnNext (used to add an image as text to the button)

//        imgViewGoOn = UIImageView(frame:CGRectMake(0, 0, 80, 30));
        imgViewGoOn.image = UIImage(named: "goOn")
        imgViewGoOn.contentMode = UIViewContentMode.ScaleAspectFit
        imgViewGoOn.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imgViewGoOn)
        
        imgViewHand.image = imgHand!
        imgViewHand.contentMode = UIViewContentMode.ScaleAspectFit
        imgViewHand.translatesAutoresizingMaskIntoConstraints = true
        
        
    }

    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    internal convenience init(showcaseViewArray: [ShowcaseView], rotationDegreesArray: [CGFloat]) {
        self.init()
        
        self.showcaseViewArray = showcaseViewArray
        self.rotationDegreesArray = rotationDegreesArray
    }
    
    override public func layoutSubviews() {
        
        // Get the superview's layout

        let margins = self.layoutMarginsGuide
        
        let container = UILayoutGuide()
        self.addLayoutGuide(container)
        
        // Generating the initial constraints
        
        btnPrevious.leadingAnchor.constraintEqualToAnchor(container.leadingAnchor).active = true
        btnPrevious.widthAnchor.constraintEqualToAnchor(btnSkip.widthAnchor).active = true
        btnPrevious.bottomAnchor.constraintEqualToAnchor(imgViewBack.topAnchor).active = true
        
        btnSkip.leadingAnchor.constraintEqualToAnchor(btnPrevious.trailingAnchor).active = true
        btnSkip.trailingAnchor.constraintEqualToAnchor(btnNext.leadingAnchor).active = true
        btnSkip.centerXAnchor.constraintEqualToAnchor(container.centerXAnchor).active = true
        btnSkip.centerYAnchor.constraintEqualToAnchor(btnPrevious.bottomAnchor).active = true
        
        btnNext.trailingAnchor.constraintEqualToAnchor(container.trailingAnchor).active = true
        btnNext.bottomAnchor.constraintEqualToAnchor(btnPrevious.bottomAnchor).active = true
        btnNext.widthAnchor.constraintEqualToAnchor(btnPrevious.widthAnchor).active = true
        
        imgViewBack.centerXAnchor.constraintEqualToAnchor(btnPrevious.centerXAnchor).active = true
        imgViewBack.bottomAnchor.constraintEqualToAnchor(margins.bottomAnchor, constant: -20).active = true
        imgViewBack.leadingAnchor.constraintEqualToAnchor(btnPrevious.leadingAnchor).active = true
        imgViewBack.trailingAnchor.constraintEqualToAnchor(btnPrevious.trailingAnchor).active = true

        imgViewGoOn.centerXAnchor.constraintEqualToAnchor(btnNext.centerXAnchor).active = true
        imgViewGoOn.bottomAnchor.constraintEqualToAnchor(imgViewBack.bottomAnchor).active = true
        imgViewGoOn.leadingAnchor.constraintEqualToAnchor(btnNext.leadingAnchor).active = true
        imgViewGoOn.trailingAnchor.constraintEqualToAnchor(btnNext.trailingAnchor).active = true

        
        container.centerYAnchor.constraintEqualToAnchor(margins.centerYAnchor).active = true
        container.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor).active = true
        container.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor).active = true
        
        self.showcaseViewArray[0].hidden = false
        self.btnPrevious.hidden = true
        self.imgViewBack.hidden = true
        
        print("imgHand width: \(imgHand!.size.width) height: \(imgHand!.size.height)")
    
        imgViewHand.frame = CGRectMake(self.showcaseViewArray[0].originX! + self.showcaseViewArray[0].newRadius! - imgViewHand.frame.width / 2, self.showcaseViewArray[0].originY! + self.showcaseViewArray[0].newRadius!, imgHand!.size.width / 3, imgHand!.size.height / 3)
        imgViewHand.rotateToDegrees(rotationDegreesArray[0])
        addSubview(imgViewHand)
        
        imgViewHand.bloat()

        print("imgViewHand width: \(imgViewHand.frame.width) height: \(imgViewHand.frame.height)")
        
        print("screen width: \(UIScreen.mainScreen().bounds.width) height: \(UIScreen.mainScreen().bounds.height)")
//
//        // Set the button's width and height to a square the size of the frame's height.
//        let buttonSize = Int(frame.size.height)
//        
//        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
//        
//        //Offset each button's origin by the length of the button plus spacing.
//        for (index, button) in ratingButtons.enumerate() {
//            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
//            button.frame = buttonFrame
//        }
//        updateButtonSelectionStates()

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
        
        btnNext.shakeFromDown()
        btnPrevious.shakeFromUp()
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
    
    /**
        Called when the overlay is meant to dissapear of the screen.
        
        - Parameters:
            - sender: The one who has to dissapear from the screen.
    */
    func closePopup(sender: AnyObject) {
        self.removeAnimate()
    }
    
    // MARK: Button's Actions
    
    /**
        btnNext's event listener to iterate forward showcase views
        
        - Parameters:
            - showcaseView: The current visible showcaseView reference
    */
    func onNextButtonTapped(showcaseView: ShowcaseView){
//        self.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
        btnPrevious.hidden = false
        imgViewBack.hidden = false
        for(index, showcaseView) in showcaseViewArray.enumerate().reverse() {
            if showcaseView.hidden == false {
                if  showcaseViewArray.indexOf(showcaseView) <= showcaseViewArray.count - 2{
                    btnNext.hidden = false
                    imgViewGoOn.hidden = false
                    showcaseView.hidden = true
                    let nextShowcaseView = showcaseViewArray[showcaseViewArray.indexOf(showcaseView)! + 1]
                    imgViewHand.rotateToDegrees(rotationDegreesArray[showcaseViewArray.indexOf(nextShowcaseView)!])
                    setHandPositionInPoint(CGPoint(x: nextShowcaseView.originX! + nextShowcaseView.newRadius! - imgViewHand.frame.width / 2, y: nextShowcaseView.originY! + nextShowcaseView.newRadius!))
                    nextShowcaseView.hidden = false
                    if index == showcaseViewArray.count - 2 {
                        btnNext.hidden = true
                        imgViewGoOn.hidden = true
                    }
                }
            }
        }
    }
    
    /**
     btnPrevious's event listener to iterate backwards showcase views
     
     - Parameters:
     - showcaseView: The current visible showcaseView reference
     */
    func onPreviousButtonTapped(showcaseView: ShowcaseView){
//        self.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
        btnNext.hidden = false
        imgViewGoOn.hidden = false
        for(index, showcaseView) in showcaseViewArray.enumerate() {
            if showcaseView.hidden == false {
                if index >= 1 {
                    btnPrevious.hidden = false
                    imgViewBack.hidden = false
                    showcaseView.hidden = true
                    let previousShowcaseView = showcaseViewArray[showcaseViewArray.indexOf(showcaseView)! - 1]
                    imgViewHand.rotateToDegrees(rotationDegreesArray[showcaseViewArray.indexOf(previousShowcaseView)!])
                    setHandPositionInPoint(CGPoint(x: previousShowcaseView.originX! + previousShowcaseView.newRadius! - imgViewHand.frame.width / 2, y: previousShowcaseView.originY! + previousShowcaseView.newRadius!))
                    previousShowcaseView.hidden = false
                    if index == 1 {
                        btnPrevious.hidden = true
                        imgViewBack.hidden = true
                    }
                }
            }
        }
    }
    
    /**
        btnSkip's event listener to close the overlay
     
         - Parameters:
             - button: The button's reference from the addTarget assignation
     */
    func onSkipButtonTapped(){
        self.removeAnimate()
        print("Skipp in overlay pressed")
        for(_, showcaseView) in showcaseViewArray.enumerate() {
            showcaseView.removeAnimate()
        }
    }
    
    // MARK: Hand functionality
    
    func setHandPositionInPoint(point: CGPoint){
        imgViewHand.frame = CGRectMake(point.x, point.y, imgHand!.size.width / 3, imgHand!.size.height / 3)
        imgViewHand.hidden = false
    }
   
}