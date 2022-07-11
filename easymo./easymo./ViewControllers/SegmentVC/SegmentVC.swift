//
//  SegmentVC.swift
//  easymo.
//
//  Created by mac on 2.07.22.
//

import UIKit

class SegmentVC: UIViewController {
    
    @IBOutlet weak var filterImage: UIImageView!
    @IBOutlet weak var segmetControl: UISegmentedControl!
    
    @IBOutlet weak var containerView: UIView!
    
    var reportVC: ReportVC?
    var historyVC: HistoryVC?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        filterImage.image = UIImage.init(named: "ic-filter")
        
        let filterTap = UITapGestureRecognizer(target: self, action: #selector(filterImageDidTap))
        filterImage.addGestureRecognizer(filterTap)
        filterImage.isUserInteractionEnabled = true

    }
    
    @objc func filterImageDidTap() {
        let filterVC = FilterVc(nibName: String(describing: FilterVc.self), bundle: nil)
        present(filterVC, animated: true)
    }
    
    private func setupController() {
        self.historyVC = HistoryVC(nibName: String(describing: HistoryVC.self), bundle: nil)
        self.reportVC = ReportVC(nibName: String(describing: ReportVC.self), bundle: nil)
        
        setupConstraintsFor(controller: historyVC)
    }
    
    private func setupConstraintsFor(controller: UIViewController?) {
        guard let controller = controller else {
            return
        }
        
        containerView.addSubview(controller.view)
        
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([controller.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                                     controller.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                                     controller.view.topAnchor.constraint(equalTo: containerView.topAnchor),
                                     controller.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)])
        self.addChild(controller)
        controller.didMove(toParent: self)
    }
    private func removeEmbeddedController() {
        reportVC?.removeFromParent()
        historyVC?.removeFromParent()
        
        reportVC?.view.removeFromSuperview()
        historyVC?.view.removeFromSuperview()
        
        reportVC?.didMove(toParent: nil)
        historyVC?.didMove(toParent: nil)

    }
    
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        removeEmbeddedController()
        
        if sender.selectedSegmentIndex == 0 {
            //            встраиваем сюда контроллер людей
            setupConstraintsFor(controller: historyVC)
        } else if sender.selectedSegmentIndex == 1 {
            //           встраиваем контроллер групп
            setupConstraintsFor(controller: reportVC)
        } 
        self.view.endEditing(true)
    }
    

}
