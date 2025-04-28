//
//  NameTbaleViewCell.swift
//  ProductObjectDisplay
//
//  Created by Mike Tshimbadi on 4/24/25.
//

import UIKit

class NameTbaleViewCell: UITableViewCell {

    
  
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameView: UILabel!
    @IBOutlet weak var productPriceView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
