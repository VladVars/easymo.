//
//  FirstInputVC.swift
//  easymo.
//
//  Created by mac on 17.07.22.
//

import UIKit

class FirstInputVC: UIViewController {

    @IBOutlet weak var goButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        goButton.layer.cornerRadius = 12
        
    }

    @IBAction func goAction(_ sender: Any) {
        let inputVC = InputVC(nibName: String(describing: InputVC.self), bundle: nil)
        navigationController?.pushViewController(inputVC, animated: true)
    }
    
}
