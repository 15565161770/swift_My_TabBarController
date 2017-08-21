//
//  MyTabBarController.swift
//  TabBar
//
//  Created by 仝兴伟 on 2017/8/15.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 添加控制器
        addAllChildVcs()
        // 自定义tabbar
        addCustomTabBar()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// 创建自定义tabbar
extension MyTabBarController{
    func addCustomTabBar()  {
        let custonTabBar = MyTabBar()
        custonTabBar.delegates = self
        self.setValue(custonTabBar, forKeyPath: "tabBar")
    }
    
}

extension MyTabBarController:DelegateTabBarDelegate{
    func tabBarDicClickPlusButton(_ tabBar: MyTabBar) {
        print("tabBarDicClickPlusButton")
        let mid = MiddleVC()
        let nav = UINavigationController(rootViewController: mid)
        self.present(nav, animated: true, completion: nil)
    }
}

extension MyTabBarController {
    func addAllChildVcs()  {
        addOneChlildVc(childVC: OneVC(), title: "首页", imageName: "tabbar_home")
        addOneChlildVc(childVC: TowVC(), title: "消息", imageName: "tabbar_message_center")
        addOneChlildVc(childVC: TreeVC(), title: "发现", imageName: "tabbar_discover")
        addOneChlildVc(childVC: FourVC(), title: "我", imageName: "tabbar_profile")
    }
    
    func addOneChlildVc(childVC : UIViewController, title : String, imageName : String)  {
        // 设置标题
        childVC.title = title;
        // 设置图标
        childVC.tabBarItem.image = UIImage.init(named: imageName)
        childVC.tabBarItem.selectedImage = UIImage.init(named: imageName + "_selected")
        let nav = MyNavigationController.init(rootViewController: childVC)
        self.addChildViewController(nav)
        
    }
    
}

