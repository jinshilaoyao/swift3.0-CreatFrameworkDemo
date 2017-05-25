//
//  RandomColor.swift
//  getColorExten
//
//  Created by yesway on 2017/5/25.
//  Copyright © 2017年 yesway. All rights reserved.
//

import UIKit

public class RandomColor: UIColor {
    
    
    open func getRandomColor() -> UIColor? {
        /**
         * 创建颜色
         */
        let color = UIColor(red: 183/255.0, green: 183/255.0, blue: 183/255.0,alpha: 1.0)
        let color1 = UIColor.blue
        let color2 = UIColor.brown
        let color3 = UIColor.yellow
        let color4 = UIColor.orange
        let color5 = UIColor.black
        
        /**
         * 创建可变数组并把颜色添加到数组
         */
        let arrM :NSMutableArray = NSMutableArray()
        arrM.add(color)
        arrM.add(color1)
        arrM.add(color2)
        arrM.add(color3)
        arrM.add(color4)
        arrM.add(color5)
        /**
         * 把颜色赋值给父控件的view
         */
        return arrM.object(at: Int(arc4random_uniform(UInt32(arrM.count)))) as? UIColor
    }

}
