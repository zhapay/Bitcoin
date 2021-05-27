//
//  ViewController.swift
//  bitcoin
//
//  Created by Dastan Zhapay on 8/3/20.
//  Copyright © 2020 Dastan Zhapay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let tabbarVC = UITabBarController()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        VCSettings()

    }
    func VCSettings() {
        tabbarVC.tabBar.barTintColor = #colorLiteral(red: 0.2392156863, green: 0.2431372549, blue: 0.3921568627, alpha: 1)

        let vc1 = MainViewController()
        vc1.title = "Курсы Валют"
        vc1.view.backgroundColor = #colorLiteral(red: 0.1764705882, green: 0.1803921569, blue: 0.2901960784, alpha: 1)
        
        let vc2 = TransactionViewController()
        vc2.title = "Transaction"
        vc2.view.backgroundColor = #colorLiteral(red: 0.1764705882, green: 0.1803921569, blue: 0.2901960784, alpha: 1)
        
        vc1.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        let controllers = [vc1,vc2]
        tabbarVC.viewControllers = controllers
        tabbarVC.viewControllers = controllers.map {
            UINavigationController(rootViewController: $0)
        }
          self.view.addSubview(tabbarVC.view)
    }
}

