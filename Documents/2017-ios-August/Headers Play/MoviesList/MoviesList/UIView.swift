//
//  UIView.swift
//  MoviesList
//
//  Created by mobile dev3 on 8/29/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit


extension UIView {
    func cardView(){
        self.backgroundColor = UIColor.white
        //  contentView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
        self.layer.cornerRadius = 4.0
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = 0.7
    }

}


