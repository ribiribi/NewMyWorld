//
//  EditVC.swift
//  MyWorld
//
//  Created by user143594 on 11/15/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import UIKit


class EditVC: UIViewController, UITextViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate  {
    
    @IBOutlet weak var nameEdit: UITextView!
    @IBOutlet weak var imageEdit: UIImageView!
    @IBOutlet weak var descriptionEdit: UITextView!
    @IBOutlet weak var webAddressEdit: UITextView!
    @IBOutlet weak var pickerViewEdit: UIPickerView!
    @IBOutlet weak var stackViewEdit: UIStackView!
    @IBOutlet weak var iconEdit: UIImageView!
    
    let manager = PlaceManager.shared
    var place: Place!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.nameEdit?.text = place.name
        self.imageEdit?.image = UIImage(named: place.imageName)
        self.descriptionEdit?.text = place.descriptionPlace
        self.webAddressEdit?.text = place.webAddress
        

        if let initialIcon = place.pickerViewArray.index(of: place.iconTable){
            pickerViewEdit.selectRow(initialIcon, inComponent: 0, animated: true)
        }
        else{
            pickerViewEdit.selectRow(0, inComponent: 0, animated: true)
        }
        
        
        descriptionEdit.layer.borderColor = UIColor.white.cgColor
        descriptionEdit.layer.borderWidth = 0.3
        descriptionEdit.layer.cornerRadius = 8
        webAddressEdit.layer.borderColor = UIColor.white.cgColor
        webAddressEdit.layer.borderWidth = 0.3
        webAddressEdit.layer.cornerRadius = 8
        nameEdit.layer.borderColor = UIColor.white.cgColor
        nameEdit.layer.borderWidth = 0.3
        nameEdit.layer.cornerRadius = 8
        imageEdit.layer.cornerRadius = 8
    }
    

    //PickerView functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return place.pickerViewArray.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var pickerLabel: UILabel? = (view as? UILabel)
        
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "Georgia", size: 14.0)
            pickerLabel?.textAlignment = .center
            pickerLabel?.textColor = UIColor.white
        }
        pickerLabel?.text = place.pickerViewArray[row]
        pickerLabel?.textColor = UIColor.white
        
        return pickerLabel!
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        iconEdit.image = UIImage(named: (place.pickerViewArray[row]))
        
        for item in self.manager.places {
            if place.id == item.id{
                //Save into manager
                place.name = nameEdit.text
                place.descriptionPlace = descriptionEdit.text
                place.webAddress = webAddressEdit.text
                place.iconTable = place.pickerViewArray[row]
                //Save into file
                manager.saveJsonToFile(origin: manager.places)
            }
        }
    }
    
    
    //Hide the iPhone keyboard
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        
        let movementDuration:TimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = self.view.frame.offsetBy(dx:0, dy: movement)
        UIView.commitAnimations()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    internal func textViewDidBeginEditing(_ textView: UITextView) {
        if textView != self.nameEdit{
            self.animateViewMoving(up: true, moveValue: 100)
        }
    }
    
    
    internal func textViewDidEndEditing(_ textView: UITextView) {
        if textView != self.nameEdit{
            self.animateViewMoving(up: false, moveValue: 100)
        }
    }
    
    
    //Save when changes happen
    internal func textViewDidChange(_ textView: UITextView){
        
        for item in self.manager.places {
            
            if place.id == item.id{
                //Save into manager
                place.name = nameEdit.text
                place.descriptionPlace = descriptionEdit.text
                place.webAddress = webAddressEdit.text                
                //Save into file
                manager.saveJsonToFile(origin: manager.places)
            }
        }
    }
}
