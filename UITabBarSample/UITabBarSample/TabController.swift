//
//  TabController.swift
//  UITabBarSample
//
//  Created by Kazuki Oda on 2015/11/15.
//  Copyright © 2015年 Kazuki Oda. All rights reserved.
//

import Foundation
import UIKit

public class TabController : UITabBarController {
    public override func viewDidLoad() {
        super.viewDidLoad();
        // 最初に表示するタブを決める
        self.selectedIndex = 1;
        // デリゲートを決定
        self.delegate = self;
    }
    
}

extension TabController : UITabBarControllerDelegate {
    public func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        let cases = 0;
        // タブのコントローラが[first]の場合、表示しない
        if(cases == 1) {
            if(viewController.restorationIdentifier == "first" &&
                selectedViewController!.restorationIdentifier == "second") {
                    let label = selectedViewController!.view.viewWithTag(10) as! UILabel;
                    label.text = "First View";
                    return false;
            }
            else if(viewController.restorationIdentifier == "second"){
                let label = viewController.view.viewWithTag(10) as! UILabel;
                label.text = "Second View";
            }
        }
        
        // タブのコントローラが[first]の場合、並びを変更する
        if(cases == 2) {
            if(viewController.restorationIdentifier == "first") {
                let controllers = viewControllers;
                let index = controllers!.indexOf(viewController);
                if(selectedViewController!.restorationIdentifier == "second") {
                    let label = selectedViewController!.view.viewWithTag(10) as! UILabel;
                    label.text = index == 0 ? "First View" : "Second View";
                    
                }
                self.setViewControllers([controllers![1] , controllers![0], controllers![2]], animated: false);
                return false;
            }
        }
        
        // タブコントローラが[first]の場合、コントローラと並びを変える
        if(cases == 3) {
            if(viewController.restorationIdentifier == "first") {
                let controllers = viewControllers;
                let index = controllers!.indexOf(viewController);
                if(selectedViewController!.restorationIdentifier == "second") {
                    let label = selectedViewController!.view.viewWithTag(10) as! UILabel;
                    label.text = index == 0 ? "First View" : "Second View";
                    
                }
                self.setViewControllers([controllers![1] , controllers![0], controllers![2]], animated: false);
                self.tabBar.items![1].title = "Second";
                self.tabBar.items![1].selectedImage = UIImage(named: "second");
                self.tabBar.items![1].image = UIImage(named: "second");
                
                self.tabBar.items![0].title = "First";
                self.tabBar.items![0].selectedImage = UIImage(named: "first");
                self.tabBar.items![0].image = UIImage(named: "first");
                return false;
            }
            
        }
        
        return true;
    }
}

