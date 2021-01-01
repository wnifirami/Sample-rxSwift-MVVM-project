//
//  DayViewController.swift
//  SampleProject
//
//  Created by Rami Ounifi on 1/1/2021.
//

import UIKit
import CalendarKit
class DayViewController: UIViewController {
    @IBOutlet weak var dayView: DayView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayView.dayHeaderView.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
