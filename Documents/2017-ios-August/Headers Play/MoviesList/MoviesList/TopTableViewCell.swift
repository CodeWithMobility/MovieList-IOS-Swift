//
//  TopTableViewCell.swift
//  MoviesList
//
//  Created by mobile dev3 on 8/27/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit

class TopTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
