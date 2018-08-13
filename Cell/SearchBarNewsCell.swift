//
//  SearchBarNewsCell.swift
//  DailyNewsIOS
//
//  Created by user on 2018-08-13.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import UIKit

class SearchBarNewsCell: UITableViewCell {

    @IBOutlet weak var imgSearchBar: UIImageView!
    @IBOutlet weak var lblSearchBar: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(imageUrl: String, text: String) {
        imgSearchBar.downloadImage(from: imageUrl)
        lblSearchBar.text = text
    }
}
