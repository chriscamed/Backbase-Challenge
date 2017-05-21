//
//  BookmarkedLocationTableViewCell.swift
//  Backbase Challenge
//
//  Created by Camilo Medina on 5/20/17.
//  Copyright © 2017 Camilo Medina. All rights reserved.
//

import UIKit

class BookmarkedLocationTableViewCell: UITableViewCell {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var rainChancesLabel: UILabel!
    @IBOutlet weak var windInformationLabel: UILabel!    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
