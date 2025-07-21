//
//  CountryTableViewCell.swift
//  CountryApp
//
//  Created by Mike Tshimbadi on 7/2/25.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    let nameLabel = UILabel()
    let regionLabel = UILabel()
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

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews() {
        [nameLabel, regionLabel, capitalLabel, codeLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.adjustsFontForContentSizeCategory = true
            $0.numberOfLines = 0
            contentView.addSubview($0)
        }
        
        nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        regionLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        capitalLabel.font = UIFont.preferredFont(forTextStyle: .body)
        codeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        codeLabel.textColor = .gray
        
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            // nameLabel (top-left)
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            // regionLabel (next to nameLabel)
            regionLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            regionLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 4),
            
            // codeLabel (top-right)
            codeLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            codeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            codeLabel.leadingAnchor.constraint(greaterThanOrEqualTo: regionLabel.trailingAnchor, constant: 8),

            // capitalLabel (below name + region)
            capitalLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            capitalLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            capitalLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            capitalLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }


}

