//
//  CustomCollectionViewCell.swift
//  Homework 5
//
//  Created by Дмитрий Куприенко on 19.12.2021.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(item: Data1) {
        self.imageView.layer.cornerRadius = 100
        self.nameLabel.text = "Name: \(item.name)"
        self.ageLabel.text = "Age: \(item.age)"
        let imageURL: URL = URL(string: "\(item.image)") ?? URL(string: "https:\\www.google.com")!
        self.imageView.sd_setImage(with: imageURL, completed: nil)
    }
}
