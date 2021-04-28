//
//  PlacesTableViewCell.swift
//  wildWestGame
//
//  Created by Ingvar on 28.04.2021.
//

import UIKit

class PlacesTableViewCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countyLabel: UILabel!
    @IBOutlet weak var placeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
