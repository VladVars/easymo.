//
//  DashBoardSettingCell.swift
//  easymo.
//
//  Created by mac on 16.06.22.
//

import UIKit

class DashBoardSettingCell: UITableViewCell {
    @IBOutlet weak var imageSetting: UIImageView!
    @IBOutlet weak var settingLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCellWith(_ type: SettingPoints) {
        settingLabel.text = type.settingText
        imageSetting.image = type.settingImage
    }
}
