//
//  MonthViewController.swift
//  SampleProject
//
//  Created by Rami Ounifi on 1/1/2021.
//

import UIKit
import FSCalendar
import SwiftDate
class MonthViewController: UIViewController {
    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var calendarHeight: NSLayoutConstraint!
    
    
    let cellID = "TaskMonthlyCells"
        let nib = UINib(nibName: "TaskMonthlyCells", bundle: nil)
    
    fileprivate lazy var dateFormatter2: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        formatter.locale = Locale(identifier: "fr")
        return formatter
    }()
    

    
    fileprivate let gregorian: Calendar = Calendar(identifier: .gregorian)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calendarHeight.constant = UIScreen.main.bounds.height * 0.4
          initViewAgenda()
          self.calendarView.setScope(.week, animated: true)
        registerTable()
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          self.view.layoutSubviews()
          self.view.setNeedsLayout()
          self.view.layoutIfNeeded()
      }
    
    deinit {
            print("\(#function)")
        }
}


extension MonthViewController: FSCalendarDelegate, FSCalendarDataSource, UIGestureRecognizerDelegate, FSCalendarDelegateAppearance {
    // MARK: - init View Methods
    func initViewAgenda() {
//        let fontName = "Comfortaa-Bold"
//               let fontSize = 10.0

        calendarView.delegate = self
        calendarView.dataSource = self
//        calendarView.appearance.eventDefaultColor = UIColor(red: 0, green: 0.882, blue: 0.71, alpha: 1)
//        calendarView.appearance.titleFont = UIFont(name: fontName, size: CGFloat(fontSize))
//        calendarView.appearance.weekdayFont = UIFont(name: fontName, size: CGFloat(fontSize))
        calendarView.placeholderType = .none
        calendarView.firstWeekday = 1

        
        if UIDevice.current.model.hasPrefix("iPad") {
            self.calendarHeight.constant = 400
        }
        
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                print("iPhone 5 or 5S or 5C")
                self.calendarHeight.constant = 250
                
            case 1334:
                print("iPhone 6/6S/7/8")
                self.calendarHeight.constant = 250
                
            case 1920, 2208:
                print("iPhone 6+/6S+/7+/8+")
                self.calendarHeight.constant = UIScreen.main.bounds.height * 0.4
                
            case 2436:
                print("iPhone X/XS/11 Pro")
                self.calendarHeight.constant = UIScreen.main.bounds.height * 0.4
            case 2688:
                print("iPhone XS Max/11 Pro Max")
                self.calendarHeight.constant = UIScreen.main.bounds.height * 0.4
            case 1792:
                print("iPhone XR/ 11 ")
                self.calendarHeight.constant = UIScreen.main.bounds.height * 0.4
            default:
                print("Unknown")
            }
        }
        
        self.calendarView.select(Date())
       // self.eventsElementsArray = viewModel?.getMultipleEvents(date: Date().toFormat("yyyy/MM/dd"))
       
        initDateLabels(date:  self.calendarView.currentPage)
 
        self.calendarView.scope = .month
        self.calendarView.accessibilityIdentifier = "calendar"
    }
    
    
    
    func initDateLabels(date: Date) {
           let headerDate = getCurrentDateTitle(date: date)
             }
    func getCurrentDateTitle(date: Date) -> String {
        let currentMonth = self.dateFormatter.monthSymbols[(date.dateComponents.month ?? 0) - 1]
        return "\(currentMonth.uppercased()) \(date.dateComponents.year ?? 0)"
    }
    

     func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
          let selectedDate = self.dateFormatter.string(from: date)
         print("did select date \(selectedDate))")
        
         let selectedDates = calendar.selectedDates.map({self.dateFormatter.string(from: $0)})
         print("selected dates is \(selectedDates)")
         if monthPosition == .next || monthPosition == .previous {
             calendar.setCurrentPage(date, animated: true)
         }
         
//         self.eventsElementsArray = viewModel?.getMultipleEvents(date: selectedDate)
//         print(self.eventsElementsArray!)
     }
     
     func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
         print("\(self.dateFormatter.string(from: calendar.currentPage))")
         initDateLabels(date: calendar.currentPage)
     }
     
     
     
     func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
         let dateString = self.dateFormatter2.string(from: date)
//         if self.datesWithEvent.contains(dateString) {
//             return 1
//         }
//         if self.datesWithMultipleEvents.contains(dateString) {
//             return 4
//         }
         return 0
     }
     
     func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventDefaultColorsFor date: Date) -> [UIColor]? {
         let key = self.dateFormatter2.string(from: date)
//         if self.datesWithMultipleEvents.contains(key) {
//            if var colorsForDate = viewModel?.getColorsForMultipleEvent(date: key),colorsForDate.count == 2 {
//                 colorsForDate.append(.clear)
//                 return colorsForDate
//             }else {
//                  return viewModel?.getColorsForMultipleEvent(date: key)
//             }
//         }
//         if self.datesWithEvent.contains(key) {
//             return viewModel?.getColorsForMultipleEvent(date: key)
//         }
         
         return nil
     }
     func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventSelectionColorsFor date: Date) -> [UIColor]? {
         let key = self.dateFormatter2.string(from: date)
//         if self.datesWithMultipleEvents.contains(key) {
//             if var colorsForDate = viewModel?.getColorsForMultipleEvent(date: key),colorsForDate.count == 2 {
//                 colorsForDate.append(.clear)
//                 return colorsForDate
//             }else {
//                  return viewModel?.getColorsForMultipleEvent(date: key)
//             }
//
//         }
//         if self.datesWithEvent.contains(key) {
//             return viewModel?.getColorsForMultipleEvent(date: key)
//         }
         
         return nil
     }
     
     
     func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at monthPosition: FSCalendarMonthPosition) {
         initDateLabels(date: date)
     }
     func maximumDate(for calendar: FSCalendar) -> Date {
         return Date() + 2.years
     }
     
     
     
//     func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, borderRadiusFor date: Date) -> CGFloat {
//
//         return 0.55
//     }
//
     
     func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
         
         if Date() - 1.days  <= date {
             if Date() - 1.days   == date {
                 return UIColor(red: 0, green: 0.882, blue: 0.71, alpha: 1)
             } else {
                return .black
             } } else {
            return .gray
         }
     }
     
      
    
}


extension MonthViewController : UITableViewDelegate, UITableViewDataSource {
    // MARK:- UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 10

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskMonthlyCells", for: indexPath) as? TaskMonthlyCells

//        guard let events = eventsElementsArray else { return cell ?? UITableViewCell() }
//        if indexPath.section == 0 {
//           cell?.updateView(event: events,indexPath: indexPath)
//        }else {
//            cell?.populateCellWithEcheance(events, indexPath.row)
//        }

        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }





    
    func registerTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(nib, forCellReuseIdentifier: cellID)
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        
    }


}



//extension  MonthViewController {
//
//    func getColorsForSingleEvent(date: String) -> UIColor {
//        return  .clear
//    }
//
//    func getCurrentDateTitle(date: Date) -> String {
//        let currentMonth = self.dateFormatter.monthSymbols[(date.dateComponents.month ?? 0) - 1]
//        return "\(currentMonth.uppercased()) \(date.dateComponents.year ?? 0)"
//    }
//
//    func getPreviousNextDateTitle(date: Date, Next: Bool) -> String {
//        if Next {
//            if date.dateComponents.month ?? 0 == 12 {
//                return self.dateFormatter.shortMonthSymbols[0]
//            } else {
//                return self.dateFormatter.shortMonthSymbols[(date.dateComponents.month ?? 0)]
//            } } else {
//            if date.dateComponents.month ?? 0 == 1 {
//                return self.dateFormatter.shortMonthSymbols[11]
//            } else {
//                return self.dateFormatter.shortMonthSymbols[(date.dateComponents.month ?? 0) - 2]
//            }
//
//        }
//    }
//}
