//
//  extensionPickerView.swift
//  MemoryMaster
//
//  Created by Mohpreet Kaur on 8/7/21.
//

import Foundation
import UIKit

//MARK: Picker View Protocol implementation
extension MainMenuViewController {    
    // number of selected elements in picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // number of rows in picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayValues.count
    }
    
    // adding some customization to the picker view
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        difficulty = arrayValues[row]
        return NSAttributedString(string: arrayValues[row], attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
    }
    
    // function used to hide picker view when touched anywhere outside the picker view or next button
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touch = touches.first
        if touch?.view != self.pickerView && touch?.view != self.btnNext{
            pickerView.isHidden = true
            stackView.isHidden = false
            btnNext.isHidden = true
        }
    }
}
