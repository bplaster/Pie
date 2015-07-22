//
//  PieSliceView.swift
//  Pie
//
//  Created by Brandon Plaster on 7/20/15.
//  Copyright (c) 2015 Brandon Plaster. All rights reserved.
//

import UIKit

class PieSliceView: UIView {
    
    var angle: CGFloat = 0
    var color: UIColor = UIColor.blueColor()
    var path: UIBezierPath = UIBezierPath()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("slicePressed"))
        
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    convenience init(frame: CGRect, color:UIColor, angle:CGFloat) {
        self.init(frame: frame)
        self.color = color
        self.angle = angle
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func drawRect(rect: CGRect) {
        
        let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
        let radius: CGFloat = max(bounds.width, bounds.height)/2
        
        // Draw slice
        path = UIBezierPath(arcCenter: center,
            radius: radius,
            startAngle: 0,
            endAngle: angle,
            clockwise: true)
        path.addLineToPoint(center)
        
        self.color.setFill()
        path.fill()
    }
    
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        print(path.containsPoint(point))
        return path.containsPoint(point)
    }
    
    func slicePressed(){
        print(self.color.description + "\n")
    }


}
