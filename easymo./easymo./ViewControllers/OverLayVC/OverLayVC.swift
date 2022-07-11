//
//  OverLayVC.swift
//  easymo.
//
//  Created by mac on 7.07.22.
//

import UIKit

class OverLayVC: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(frame: self.view.frame)
        blurView.effect = blurEffect
        self.view.addSubview(blurView)
        
//        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.frame = view.bounds
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.addSubview(blurEffectView)
        
//        func blurImage() {
//          let blurEffect = UIBlurEffect(style: .regular)
//          let blurredEffectView = UIVisualEffectView(effect: blurEffect)
//          myImageView.addSubview(blurredEffectView)
//
//          scaleToFillView(blurredEffectView, in: myImageView)
//          fadeInView(blurredEffectView)
//        }
//
//        func fadeInView(_ view: UIView) {
//          view.alpha = 0
//          UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
//            view.alpha = 1
//          }, completion: nil)
//        }
    }
    
//    private func scaleToFillView(_ view: UIView, in parent: UIView) {
//        view.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate(
//            [
//                view.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
//                view.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
//                view.widthAnchor.constraint(equalTo: parent.widthAnchor),
//                view.heightAnchor.constraint(equalTo: parent.heightAnchor)
//            ]
//        )
//    }

}
