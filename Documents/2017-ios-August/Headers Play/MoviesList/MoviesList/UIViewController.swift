//
//  UIViewController.swift
//  MoviesList
//
//  Created by mobile dev3 on 8/30/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setNaviationBar(headline: String){
        self.navigationItem.title = headline
       // self.navigationController?.navigationBar.barTintColor = UIColor(hex: <#T##String#>)
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName: UIFont(name: "Futura-Medium", size: 22)!,
            NSForegroundColorAttributeName: UIColor.white
        ]
    }

    
    
    
}
