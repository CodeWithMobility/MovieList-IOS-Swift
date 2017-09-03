//
//  SearchCell.swift
//  MoviesList
//
//  Created by mobile dev3 on 8/30/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var popularityTV: UILabel!
    @IBOutlet weak var releaseDateTV: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
