//
//  TableViewTwoCell.swift
//  easymo.
//
//  Created by mac on 16.07.22.
//

import UIKit

class TableViewTwoCell: UITableViewCell {
    
    @IBOutlet weak var imageSetting: UIImageView!
    @IBOutlet weak var settingLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCellWith(_ type: SettingPointsTableTwo) {
        settingLabel.text = type.settingText
        imageSetting.image = type.settingImage
    }
    
}
