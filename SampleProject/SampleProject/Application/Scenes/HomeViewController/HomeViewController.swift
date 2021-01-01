//
//  HomeViewController.swift
//  SampleProject
//
//  Created by Rami Ounifi on 1/1/2021.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var container: UIView!
    var containerSteps: [UIViewController] = []
    let monthlyVC = MonthViewController.initFromNib()
    let DailyVC = DayViewController.initFromNib()
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareContainer()
        setUpViewInContainer()
        self.view.layoutIfNeeded()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeCalendarView
    (_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            indexCurrentVC = 1
        } else {
            indexCurrentVC = 0
        }
    }
    
    var indexCurrentVC: Int = 0 {
        didSet{
            DispatchQueue.main.async {
                
                self.showNextViewControlelr(index: self.indexCurrentVC)
                self.view.layoutIfNeeded()
            }
        }
    }

    func selectViewController(index: Int){
        indexCurrentVC = index
        
    }

    
    func prepareContainer() {
        self.containerSteps.append(monthlyVC)
        self.containerSteps.append(DailyVC)
    }
    
    func showNextViewControlelr (index: Int) {
        /// remove old VC
        self.children.forEach {
            $0.didMove(toParent: nil)
            $0.view.removeFromSuperview()
            $0.removeFromParent()
        }
        
        self.viewDidLayoutSubviews()
        UIView.transition(with: self.view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            if let newVC = self.containerSteps[index] as? UIViewController {
                newVC.view.frame = self.container.bounds
                self.addChild(newVC)
                self.container.addSubview(newVC.view)
                newVC.didMove(toParent: self) }
        }, completion: nil)
    }
    
    
    
    func setUpViewInContainer () {
        showNextViewControlelr(index: indexCurrentVC)
    }
    
}
