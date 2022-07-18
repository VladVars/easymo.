//
//  SettingCurencyCell.swift
//  easymo.
//
//  Created by mac on 17.07.22.
//

import UIKit

class SettingCurencyCell: UITableViewCell {
    
    @IBOutlet weak var viewImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCellWith(_ type: SettingPointsCurency) {
        nameLabel.text = type.settingText
        viewImage.image = type.settingImage
    }
    
}
