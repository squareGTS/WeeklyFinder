//
//  ViewController.swift
//  WeeklyFinder
//
//  Created by Maxim Bekmetov on 17.08.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func findDay(_ sender: UIButton) {
        
        guard let day = dateTF.text, let month = monthTF.text, let year = yearTF.text else { return }
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateFormater = DateFormatter()
        dateFormater.locale = Locale(identifier: "ru_ru")
        dateFormater.dateFormat = "EEEE"
        
        guard let date = calendar.date(from: dateComponents) else  { return }
        
        let weekday = dateFormater.string(from: date)
        let capitalizeWeekday = weekday.capitalized
        resultLabel.text = capitalizeWeekday
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

