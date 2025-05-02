//
//  CountryTableViewCell.swift
//  CountryApiCallsApp
//
//  Created by Mike Tshimbadi on 5/1/25.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    
    @IBOutlet weak var codeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
