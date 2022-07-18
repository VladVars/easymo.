//
//  Update.swift
//  easymo.
//
//  Created by mac on 4.07.22.
//

import Foundation
import UIKit

protocol Update: AnyObject {
    func updataText(text: String)
    func updateViewColor(color: UIColor)
    func changeTitleView(title : String)
    func update()
   
}
