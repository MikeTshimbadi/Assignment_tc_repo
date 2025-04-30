//
//  NameTableTableViewCell.swift
//  CountryEmployeeDisplayApp
//
//  Created by Mike Tshimbadi on 4/29/25.
//

import UIKit

class NameTableTableViewCell: UITableViewCell {

    @IBOutlet weak var empImageLabel: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
