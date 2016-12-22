//
//  MAGlowingLabel.swift
//  MAGlowingLabel
//
//  Created by MARWAN on 12/2/16.
//  Copyright © 2016 MARWAN. All rights reserved.
//

import UIKit

class MAGlowingLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addGlowingEffect();
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addGlowingEffect()
    }
    
    func addGlowingEffect()  {
        let labelTransparency :CGFloat = 0.5
        let labelWidth:CGFloat = self.frame.size.width
        
        let glowSize :CGFloat = 40 / labelWidth
        
        let startingLocations :NSArray = [NSNumber.init(float:0.0), NSNumber.init(float:((Float)(glowSize / 2))),NSNumber.init(float:((Float)(glowSize)/1))]
        
        let endingLocations = [(1.0 - glowSize), (1.0 - (glowSize / 2)), 1.0] as NSArray
        
        let animation :CABasicAnimation = CABasicAnimation(keyPath: "locations")
        let glowMask:CAGradientLayer = CAGradientLayer.init()
        glowMask.frame = self.bounds
        
        let gradient = UIColor.init(white: 0.5, alpha: labelTransparency)
        glowMask.colors =  [gradient.CGColor,UIColor.whiteColor().CGColor,gradient.CGColor]
        glowMask.locations = startingLocations as? [NSNumber]
        glowMask.startPoint = CGPointMake(0 - (glowSize * 2), 1)
        glowMask.endPoint = CGPointMake(1 + glowSize , 1)
        self.layer.mask = glowMask
        
        animation.fromValue = startingLocations
        animation.toValue = endingLocations
        animation.repeatCount = Float.infinity
        animation.duration = 1.5
        animation.removedOnCompletion = false
        glowMask.addAnimation(animation, forKey: "gradientAnimation")
    }
}
