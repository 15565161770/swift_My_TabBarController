//
//  ViewController.swift
//  TabBar
//
//  Created by 仝兴伟 on 2017/8/21.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    convenience init(imageName : String, target : AnyObject, action : Selector) {
        self.init()
        let Btn = UIButton()
        Btn.setImage(UIImage(named :imageName), for: .normal)
        Btn.setImage(UIImage(named : imageName + "_highlighted"), for: .highlighted)
        Btn.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        Btn.sizeToFit()
        self.customView = Btn
    }
}
