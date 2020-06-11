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
    
    func setCell(category: CategoryModel) {
        self.categoryImageView.image = UIImage(named: category.categoryImage)
        self.categoryImageView.layer.cornerRadius = 50
        
        self.categoryLabel.text = category.name
    }
    
    
}
