//
//  MyNavigationController.swift
//  TabBar
//
//  Created by 仝兴伟 on 2017/8/21.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

import UIKit

class MyNavigationController: UINavigationController {

    override class func initialize()  {
        
        // 设置UINavigationBarTheme
//        setupNavigationBarTheme()
        
        // 设置UIBarButtonItem的主题
//        setupBarButtonItemTheme()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
}
    
    /**
     *  设置UINavigationBarTheme的主题
     */
    class func setupNavigationBarTheme()  {
        let appearance = UINavigationBar.appearance()
        // 设置导航背景颜色
        appearance.setBackgroundImage(UIImage.init(named: "navigationbar_background"), for: .default)
        
        // 设置字体属性
        var textAttrs : Dictionary<String,AnyObject> = [:];
        textAttrs[NSForegroundColorAttributeName] = UIColor.black
        textAttrs[NSFontAttributeName] = UIFont.boldSystemFont(ofSize: 20.0)
        // UIOffsetZero是结构体,只要包装成NSValue对象,才能放进字典数组中
        textAttrs[ NSShadowAttributeName] = NSValue.init(uiOffset: .zero)
        appearance.titleTextAttributes = textAttrs
    }
    
    /**
     *  设置UIBarButtonItem的主题
     */
    class func setupBarButtonItemTheme() {
    // 通过appearace 对象能够修改整个项目所有UIBarButtonItem的样式
        let appearance = UIBarButtonItem.appearance()
        // 设置普通状态的文字属性
        var textAttrs : Dictionary<String,AnyObject> = [:];
        textAttrs[NSForegroundColorAttributeName] = UIColor.orange
        textAttrs[NSFontAttributeName] = UIFont.boldSystemFont(ofSize: 15.0)
        textAttrs[ NSShadowAttributeName] = NSValue.init(uiOffset: .zero)
        appearance.setTitleTextAttributes(textAttrs, for: .normal)
        
        // 设置高亮状态的文字属性
        var highTextAttrs = textAttrs
        highTextAttrs[NSForegroundColorAttributeName] = UIColor.red
        appearance.setTitleTextAttributes(highTextAttrs, for: .highlighted)
        
        // 设置不可用状态(Disable)的文字属性
        var disableTextAttrs = textAttrs
        disableTextAttrs[NSForegroundColorAttributeName] = UIColor.lightGray
        appearance.setTitleTextAttributes(disableTextAttrs, for: .disabled)
        
        //设置背景颜色
        appearance.setBackgroundImage(UIImage.init(named: "navigationbar_button_background"), for: .normal, barMetrics: .default)
    }
    

    // 能拦截所有push进来的自控制器
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if  self.viewControllers.count > 0{// 如果现在push的不是栈底控制器(最先push进来的那个控制器)
            viewController.hidesBottomBarWhenPushed = true
            
            // 设置导航栏按钮
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_back", target: self, action: #selector( back))
            
            viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_more", target: self, action: #selector (more))
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    func back()  {
        self.popViewController(animated: true)
    }
    func more()  {
        self.popToRootViewController(animated: true)
    }
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}




