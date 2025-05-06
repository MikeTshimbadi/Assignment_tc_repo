//
//  NameLabelTableViewCell.swift
//  AmericanAirlineApp
//
//  Created by Mike Tshimbadi on 5/2/25.
//

import UIKit

class NameLabelTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
