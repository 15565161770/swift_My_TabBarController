//
//  MyTabBar.swift
//  TabBar
//
//  Created by 仝兴伟 on 2017/8/15.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

import UIKit

// 声明协议
protocol DelegateTabBarDelegate : NSObjectProtocol {
    func tabBarDicClickPlusButton(_ tabBar : MyTabBar)
}


class MyTabBar: UITabBar {

    var plusButton : UIButton?
    
    weak var  delegates: DelegateTabBarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 添加加号按钮
        setupPlusButton()
    }
    
    func setupPlusButton()  {
        let buttons = UIButton.init()
        buttons.setBackgroundImage(UIImage.init(named: "tabbar_compose_button"), for: .normal)
        buttons.setBackgroundImage(UIImage.init(named: "tabbar_compose_button_highlighted"), for: .highlighted)
        buttons.setImage(UIImage.init(named: "tabbar_compose_icon_add"), for: .normal)
        buttons.setImage(UIImage.init(named: "tabbar_compose_icon_add_highlighted"), for: .highlighted)
        buttons.addTarget(self, action: #selector(MyTabBar.plusClick), for: .touchUpInside)
        self.plusButton = buttons
        self.addSubview(self.plusButton!)
    }
    
    // 代理方法
    func plusClick()  {
        delegates?.tabBarDicClickPlusButton(self)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupPlusButtonFrame()
        
        setupAllTabBarButtonsFrame()
    }
    
    func setupPlusButtonFrame()  {
        self.plusButton?.size = (self.plusButton?.currentBackgroundImage?.size)!
        self.plusButton?.center = CGPoint.init(x: self.width * 0.5, y: self.height * 0.5)
    }
    
    
    func setupAllTabBarButtonsFrame()  {
        var index : Int = 0
        // 遍历所有的button
        for tabBarButton in self.subviews {
            
            if !(tabBarButton.isKind(of: NSClassFromString("UITabBarButton")!)){
                continue
            }
            setupTabBarButtonFrame(tabBarButton: tabBarButton, atIndex: index)
            // 所有增加
            index += 1
        }
    
    }
    
    /**
     *  设置某个按钮的frame
     *
     *  @param tabBarButton 需要设置的按钮
     *  @param index        按钮所在的索引
     */

    func setupTabBarButtonFrame(tabBarButton : UIView, atIndex : Int)  {
       
        let buttonW = self.width / CGFloat((self.items?.count)! + 1)
        let buttonH = self.height
        tabBarButton.width = CGFloat(buttonW)
        tabBarButton.height = CGFloat(buttonH);
        
        if atIndex >= 2 {
            tabBarButton.x = buttonW * CGFloat((atIndex + 1))
        } else {
            tabBarButton.x = buttonW * CGFloat(atIndex)
        }
        tabBarButton.y = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}



