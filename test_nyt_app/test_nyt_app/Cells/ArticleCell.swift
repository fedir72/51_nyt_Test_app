//
//  ArticleCell.swift
//  test_nyt_app
//
//  Created by fedir on 10.06.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var snippetLabel: UILabel!
    
    

 
    
    func setData(doc: Doc) {
        self.sectionLabel.text = doc.section_name
        self.sectionLabel.textColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        self.sourceLabel.text = "source: \(doc.source!)"
        self.snippetLabel.text = doc.abstract
       
    }
    
}
