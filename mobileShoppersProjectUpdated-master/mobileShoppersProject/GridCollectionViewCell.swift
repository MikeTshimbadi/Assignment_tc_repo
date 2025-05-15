//
//  GridCollectionViewCell.swift
//  mobileShoppersProject
//
//  Created by Mike Tshimbadi on 5/12/25.
//

import UIKit

class GridCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textFieldLabel: UILabel!
    
    func displayImage(urlString: String) {
        let secureUrl = urlString.replacingOccurrences(of: "http", with: "https")
        
        guard let url = URL(string:secureUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { [ weak self ] data, _, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.imageView.image = UIImage(data: data)
                }
            }
        }.resume()
    }
}
