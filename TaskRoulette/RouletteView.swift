//
//  RouletteView.swift
//  TaskRoulette
//
//  Created by 山崎ひかり on 2016/03/28.
//  Copyright © 2016年 hikariyamasaki. All rights reserved.
//

import UIKit

class RouletteView: UIView {

    var color:UIColor?

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        switch self.tag{
        case 0:
                color = UIColor.grayColor()
        case 1:
                color = UIColor.blueColor()
        default:
                color = UIColor.brownColor()
        }
        
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        let n = 6
        let r = self.frame.width * 0.5
        let angle = 2 * M_PI / Double(n)
        
        // 円を描く.
        let c:CGContextRef = UIGraphicsGetCurrentContext()!
        let w = self.bounds.size.width;
        let h = self.bounds.size.width;
        CGContextSetFillColorWithColor(c, self.color!.CGColor);
        CGContextFillEllipseInRect(c, CGRectMake(0, 0, w, h));
        
        for i in 0..<n{
            let x = r * CGFloat(cos(Double(i) * angle + angle / 2)) + self.frame.size.width / 2.0
            let y = r * CGFloat(sin(Double(i) * angle + angle / 2)) + self.frame.size.height / 2.0
            
            
            // 描画する.
            let path = UIBezierPath()
            // ラインの始点.
            path.moveToPoint(CGPointMake(self.frame.width / 2,self.frame.height / 2));
            // ラインの終点.
            path.addLineToPoint(CGPointMake(x, y))
            // ラインのカラー.
            UIColor.orangeColor().setStroke()
            path.stroke()
            
            
        }
        
        
    }
    
}
        
        

