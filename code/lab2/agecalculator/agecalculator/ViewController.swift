//
//  ViewController.swift
//  agecalculator
//
//  Created by Arias Mora, Juan Pablo on 2/1/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var dobTextField: UITextField!

    var datePicker:UIDatePicker?
    var toolBar:UIToolbar = UIToolbar()
    var dateOfBirth:Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.doDatePicker()
    }

    func doDatePicker(){
            // DatePicker
            // create a datepicker object with some frame
            self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0,
                                                        width: self.view.frame.size.width, height: 200))
            // set mode of date
            self.datePicker?.datePickerMode = UIDatePicker.Mode.date
            
            // IOS 14 Calendar https://developer.apple.com/documentation/uikit/uidatepicker
            // We need to set the default
            datePicker?.preferredDatePickerStyle = UIDatePickerStyle.wheels
            
            // Max date
            datePicker?.maximumDate = Date()
            // Set datepicker to textfield Input view
            dobTextField.inputView = datePicker

            // ToolBar
            toolBar.barStyle = .default
            toolBar.isTranslucent = true
            toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
            toolBar.sizeToFit()

            // Adding Button ToolBar
            // create done button
            let doneButton = UIBarButtonItem(title: "Done",
                                             style: .plain,
                                             target: self,
                                             action: #selector(self.doneClick))
            // space between button
            let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                              target: nil,
                                              action: nil)
            // cancel button
            let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain,
                                               target: self,
                                               action: #selector(self.cancelClick))
            // add above buttons
            toolBar.setItems([cancelButton, spaceButton, doneButton], animated: true)
            toolBar.isUserInteractionEnabled = true
            // set toolbar as textfield input accessory
            dobTextField.inputAccessoryView = toolBar


        }


        @objc func doneClick() {
            //Creating an object of date formater
            let dateFormatter = DateFormatter()
            //setting style of date
            dateFormatter.dateStyle = .medium
            //getting date object from picker
            dateOfBirth = datePicker?.date
            dobTextField.text = dateFormatter.string(from: dateOfBirth!)
            //close datepicker
            self.view.endEditing(true)


        }

        @objc func cancelClick() {
            // close datepicker
            self.view.endEditing(true)

        }
    
    @IBAction func calculateAgeBtnAxn(_ sender: Any) {
        // Check if there will be date of birth
        if let dob = dateOfBirth{
            //Today Date
            let today = Date()
            // Calendar reference
            let calendar = Calendar.current
            // Calculate age from calendar
            let age = calendar.dateComponents([.year, .month, .day], from: dob, to: today)
            let ageInYear = age.year ?? 0
            let ageInMonth = age.month ?? 0
            let ageInDays = age.day ?? 0
            
            ageLabel.text = "\(ageInYear)yr \(ageInMonth)m \(ageInDays)d"
        }
    }
}

