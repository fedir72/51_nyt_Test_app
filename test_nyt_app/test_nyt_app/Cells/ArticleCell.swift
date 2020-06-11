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
    @IBOutlet weak var snippetTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(doc: Doc) {
        self.sectionLabel.text = doc.section_name
        self.sourceLabel.text = doc.source
        self.snippetTextView.text = doc.abstract
    }
    
}
