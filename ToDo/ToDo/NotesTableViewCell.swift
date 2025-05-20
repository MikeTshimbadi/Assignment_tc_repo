//
//  NotesTableViewCell.swift
//  ToDo
//
//  Created by Mike Tshimbadi on 5/20/25.
//

import UIKit

class NotesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var noteLabel: UILabel!
    
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
