//
//  GalaxyCell.swift
//  OGame
//
//  Created by Subvert on 02.08.2021.
//

import UIKit

class GalaxyCell: UITableViewCell {

    @IBOutlet weak var planetPositionLabel: UILabel!
    @IBOutlet weak var planetImage: UIImageView!
    @IBOutlet weak var planetNameLabel: UILabel!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var allianceNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
