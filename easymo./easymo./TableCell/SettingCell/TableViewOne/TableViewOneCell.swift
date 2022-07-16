//
//  TableViewOneCell.swift
//  easymo.
//
//  Created by mac on 16.07.22.
//

import UIKit

class TableViewOneCell: UITableViewCell {
    
    @IBOutlet weak var imageSetting: UIImageView!
    @IBOutlet weak var settingLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCellWith(_ type: SettingPointsTableOne) {
        settingLabel.text = type.settingText
        imageSetting.image = type.settingImage
    }
}
