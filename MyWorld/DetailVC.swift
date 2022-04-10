//
//  DetailVC.swift
//  MyWorld
//
//  Created by user143594 on 11/12/18.
//  Copyright © 2018 user143594. All rights reserved.
//
//Detail and Description ViewControllers
import UIKit


var refresh = false


class DetailVC: UIViewController, UITabBarControllerDelegate {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet var detailView: UIView!    
    @IBOutlet weak var webAddress: UITextView!
    @IBOutlet weak var iconDetail: UIImageView!
    @IBOutlet weak var descriptionDetailVC: UILabel!
    @IBOutlet weak var scrollViewDetailVC: UIScrollView!
    @IBOutlet weak var toMapImage: UIButton!
    
    let places = PlaceManager.shared
    var place: Place!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.tabBarController?.delegate = self

        name?.text = place.name
        image?.image = UIImage(named: place.imageName)
        webAddress?.text = place.webAddress
        iconDetail?.image = UIImage(named: place.iconTable)
        descriptionDetailVC?.text = place.descriptionPlace
        
        image.layer.cornerRadius = 10
        
        refresh = true
    }
        

    override func viewDidAppear(_ animated: Bool){
        
        if refresh == true {
            name?.text = place.name
            webAddress?.text = place.webAddress
            image?.image = UIImage(named: place.imageName)
            descriptionDetailVC?.text = place.descriptionPlace
            iconDetail?.image = UIImage(named: place.iconTable)
        }
    }
    
    
    // MARK: ---------------------------------------  Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toEdit"{
            
            let editVC = segue.destination as! EditVC
            editVC.place = place
        }
        
        if segue.identifier == "toNew"{
            
            let newVC = segue.destination as! NewVC
            newVC.place = place
        }
    }
    
    
    @IBAction func toMapTab(_ sender: Any) {
        
        let navController = self.tabBarController?.viewControllers![1] as! UINavigationController
        let vc = navController.topViewController as! MapVC
        vc.place = place
        
        self.tabBarController?.selectedIndex = 1
    }
}
