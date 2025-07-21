//
//  CountryTableViewCell.swift
//  CountryApiProg
//
//  Created by Mike Tshimbadi on 5/26/25.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    let nameLabel = UILabel()
    let capitalLabel = UILabel()
    let codeLabel = UILabel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setViews()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
    }


//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews() {
        [nameLabel, capitalLabel, codeLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.numberOfLines = 1
            contentView.addSubview($0)
        }
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        capitalLabel.font = UIFont.systemFont(ofSize: 14)
        codeLabel.font = UIFont.systemFont(ofSize: 12)
        codeLabel.textColor = .gray
        
        setConstarints()
    }
    
    private func setConstarints() {
        NSLayoutConstraint.activate([
            // nameLabel - top of cell
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            // capitalLabel - below nameLabel
            capitalLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            capitalLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            capitalLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),

            // codeLabel - below capitalLabel, bottom of cell
            codeLabel.topAnchor.constraint(equalTo: capitalLabel.bottomAnchor, constant: 4),
            codeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            codeLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            codeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    } 

}
