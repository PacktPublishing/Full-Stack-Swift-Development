//
//  MicroPostCell.swift
//  microposter
//
//  Created by Johann Kerr on 6/24/18.
//  Copyright © 2018 Johann Kerr. All rights reserved.
//

import UIKit

class MicroPostCell: UITableViewCell {
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
