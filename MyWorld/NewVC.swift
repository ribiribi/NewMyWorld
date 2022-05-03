//
//  NewVC.swift
//  MyWorld
//
//  Created by user143594 on 11/21/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import UIKit
import MapKit


class NewVC: UIViewController, UITextViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate, CLLocationManagerDelegate {

    let manager = PlaceManager.shared
    var place = Place(name: "", descriptionPlace: "", webAddress: "", position: CLLocationCoordinate2D(latitude: 42.4, longitude: 2.2), imageName: "", iconTable: "Miscellanea")
    var countNum = 0
    let locationManager = CLLocationManager()
    var actualPosition = CLLocationCoordinate2D(latitude: 41.41, longitude: 2.13)
    
    
    
    let defaultNewNameText = "Write here the new name"
    let defaultDescriptionNewText = "Write here the description"
    let defaultWebAdressNewText = "Write here the web address"
    
    //textViews' placeholder #1
    var activeTextView = UITextView()
    
    
    @IBOutlet weak var nameNew: UITextView!
    @IBOutlet weak var webAddressNew: UITextView!
    @IBOutlet weak var descriptionNew: UITextView!
    @IBOutlet weak var imageNew: UIImageView!
    @IBOutlet weak var pikerViewNew: UIPickerView!
    @IBOutlet weak var iconNew: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //textViews' placeholder #2
        nameNew.delegate = self
        descriptionNew.delegate = self
        webAddressNew.delegate = self
        
        //Adding format
        self.nameNew.textColor = UIColor.white.withAlphaComponent(0.2)
        self.descriptionNew.textColor = UIColor.white.withAlphaComponent(0.2)
        self.webAddressNew.textColor = UIColor.white.withAlphaComponent(0.2)
        
        self.nameNew?.text = defaultNewNameText
        self.imageNew?.image = UIImage(named: "modernBuilding")
        self.descriptionNew?.text = defaultDescriptionNewText
        self.webAddressNew.text = defaultWebAdressNewText
        place.iconTable = "Miscellanea"
        
        
        iconNew.image = UIImage(named: "Miscellanea")
        pikerViewNew.selectRow(0, inComponent: 0, animated: true)
        
        
        descriptionNew.layer.borderColor = UIColor.white.cgColor
        descriptionNew.layer.borderWidth = 0.3
        descriptionNew.layer.cornerRadius = 8
        webAddressNew.layer.borderColor = UIColor.white.cgColor
        webAddressNew.layer.borderWidth = 0.3
        webAddressNew.layer.cornerRadius = 8
        nameNew.layer.borderColor = UIColor.white.cgColor
        nameNew.layer.borderWidth = 0.3
        nameNew.layer.cornerRadius = 8
        imageNew.layer.cornerRadius = 8
        
        
        // Ask for GPS Authorisation.
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        
        //Location
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    
    // MARK: --------------------------------------------------Functions
    
    //PickerView functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return place.pickerViewArray.count
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        iconNew.image = UIImage(named: (place.pickerViewArray[row]))
        place.iconTable = place.pickerViewArray[row]
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
   
        //textViews' placeholder #3: delete new labels text once it's clicked for the first time.
        activeTextView = textView
        
        deleteLabelText1stTime()

        
        if textView != self.nameNew{
            self.animateViewMoving(up: true, moveValue: 100)
        }
    }
    
    //textViews' placeholder #4
    func deleteLabelText1stTime () {
        
        if (activeTextView == nameNew) && (activeTextView.text == defaultNewNameText) {
            
            nameNew.text = ""
            nameNew.textColor = UIColor.white.withAlphaComponent(1)
        }
        
        if (activeTextView == descriptionNew) && (activeTextView.text == defaultDescriptionNewText) {
            
            descriptionNew.text = ""
            descriptionNew.textColor = UIColor.white.withAlphaComponent(1)
        }
        
        if (activeTextView == webAddressNew) && (activeTextView.text == defaultWebAdressNewText) {
            
            webAddressNew.text = ""
            webAddressNew.textColor = UIColor.white.withAlphaComponent(1)
        }
    }
    
    
    internal func textViewDidEndEditing(_ textView: UITextView) {
        if textView != self.nameNew{
            self.animateViewMoving(up: false, moveValue: 100)
        }
    }
    
    
    //Location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        actualPosition = locValue
        
        manager.stopUpdatingLocation()
    }
    
    //Back

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       
        if self.isMovingFromParent {
            //* Draft to control new page without data + label.placeholder.
            //if self.nameNew.text != "Write here the new name"{
        
                //Save into manager
                countNum = manager.count()
                manager.append(place)
                manager.places[countNum].name = nameNew.text
                manager.places[countNum].descriptionPlace = descriptionNew.text
                manager.places[countNum].webAddress = webAddressNew.text
                manager.places[countNum].imageName = "modernBuilding"
                manager.places[countNum].iconTable = place.iconTable
                manager.places[countNum].position = actualPosition
                //Save into file
                manager.saveJsonToFile(origin: manager.places)
//            }
//            else {
            
//                let alert = UIAlertController(title: "", message: "És necessari un titol per a crear una nova localització?", preferredStyle: UIAlertController.Style.alert)
//                self.present(alert, animated: true, completion: nil)
//
//                let accept = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) { (action) in
//                    print("Blue action button tapped")
//                }
//
//                alert.addAction(accept)
//
//                DispatchQueue.main.async{
//                     self.present(alert, animated: true, completion: nil)
//                }
//            }
        }
    }
}

