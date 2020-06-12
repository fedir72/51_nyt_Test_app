//
//  CategoryCell.swift
//  test_nyt_app
//
//  Created by fedir on 10.06.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.categoryImageView.layer.cornerRadius = categoryImageView.frame.width / 2
    }
    
    func setCell(category: Category) {
        self.categoryImageView.image = UIImage(named: category.categoryImage)
        self.categoryLabel.text = category.name
    }
    
    
}
