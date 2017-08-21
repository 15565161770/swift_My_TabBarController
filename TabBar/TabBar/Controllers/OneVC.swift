//
//  OneVC.swift
//  UITabBarController
//
//  Created by Apple on 17/3/15.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

import UIKit

class OneVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

        // Do any additional setup after loading the view.
        
        let button = UIButton()
        button.frame = .init(x: 100, y: 100, width: 100, height: 100)
        button.backgroundColor = UIColor.brown
        button.addTarget(self, action: #selector(pushToParent), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    func pushToParent()  {
        let three =  OtherController()
        self.navigationController?.pushViewController(three, animated: true);
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}




