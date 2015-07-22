//
//  PieChartView.swift
//  Pie
//
//  Created by Brandon Plaster on 7/19/15.
//  Copyright (c) 2015 Brandon Plaster. All rights reserved.
//

import UIKit

let π:CGFloat = CGFloat(M_PI)

struct Slice {
    var angle: CGFloat = 0
    var color: UIColor = UIColor.blueColor()
}

class PieChartView: UIView {

    var selected: Int = 0
    var isPressed: Bool = false
    var offset: Int = 50
    var outlineColor: UIColor = UIColor.lightGrayColor()
    
    let slices: [Slice] = [ Slice(angle: 0.15*2*π, color: UIColor.blueColor()),
                            Slice(angle: 0.20*2*π, color: UIColor.orangeColor()),
                            Slice(angle: 0.05*2*π, color: UIColor.redColor()),
                            Slice(angle: 0.10*2*π, color: UIColor.yellowColor()),
                            Slice(angle: 0.30*2*π, color: UIColor.purpleColor()),
                            Slice(angle: 0.20*2*π, color: UIColor.greenColor())  ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadSubViews()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadSubViews()
    }
    
    func loadSubViews() {
        var angle: CGFloat = 0.0
        for slice in slices {
            let sliceView = PieSliceView(frame: bounds, color: slice.color, angle: slice.angle)
            sliceView.transform = CGAffineTransformRotate(sliceView.transform, angle)
            self.addSubview(sliceView)
            angle += slice.angle
        }
    }
    
}