//
//  DetailsCell.swift
//  ItunesMediafetcher
//
//  Created by PC on 26/09/18.
//  Copyright © 2018 PC. All rights reserved.
//

import UIKit

class DetailsCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetails: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
