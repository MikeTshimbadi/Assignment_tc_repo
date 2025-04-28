//
//  NameTableViewCell.swift
//  CountryDataApp
//
//  Created by Mike Tshimbadi on 4/28/25.
//

import UIKit

class NameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var CountryName: UILabel!
    @IBOutlet weak var CountryCapitalView: UILabel!
    @IBOutlet weak var CountryCodeView: UILabel!
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
