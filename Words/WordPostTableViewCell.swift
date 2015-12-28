//
//  WordPostTableViewCell.swift
//  Words
//
//  Created by Eric Schulz on 12/28/15.
//  Copyright © 2015 Eric Schulz. All rights reserved.
//

import UIKit

class WordPostTableViewCell: UITableViewCell {

    @IBOutlet weak var postLabel: UILabel!
    
    
    @IBOutlet weak var userImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
