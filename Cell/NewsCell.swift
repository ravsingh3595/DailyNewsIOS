//
//  NewsCell.swift
//  DailyNewsIOS
//
//  Created by user on 2018-08-12.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsLabelView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell(imageUrl: String, text: String) {
        newsImageView.downloadImage(from: imageUrl)
        newsLabelView.text = text
    }
}
