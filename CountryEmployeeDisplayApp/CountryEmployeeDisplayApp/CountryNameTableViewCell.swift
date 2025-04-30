//
//  CountryNameTableViewCell.swift
//  CountryEmployeeDisplayApp
//
//  Created by Mike Tshimbadi on 4/29/25.
//

import UIKit

class CountryNameTableViewCell: UITableViewCell {

    
    @IBOutlet weak var CountryNameLabel: UILabel!
    @IBOutlet weak var CapitalLabel: UILabel!
    @IBOutlet weak var CodeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
