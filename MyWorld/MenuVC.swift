//
//  MenuVC.swift
//  MyWorld
//
//  Created by user143594 on 12/4/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {

    
    @IBOutlet weak var oneXOne: UIButton!
    @IBOutlet weak var twoXOne: UIButton!
    @IBOutlet weak var threeXOne: UIButton!
    @IBOutlet weak var oneXTwo: UIButton!
    @IBOutlet weak var twoXTwo: UIButton!
    @IBOutlet weak var threeXThree: UIButton!
    @IBOutlet weak var viewOneXOne: UIView!
    @IBOutlet weak var labelOneXOne: UILabel!
    @IBOutlet weak var viewTwoXOne: UIView!
    @IBOutlet weak var labelTwoXOne: UILabel!
    @IBOutlet weak var viewThreeXOne: UIView!
    @IBOutlet weak var labelThreeXOne: UILabel!
    @IBOutlet weak var viewOneXTo: UIView!
    @IBOutlet weak var labelOneXTo: UILabel!
    @IBOutlet weak var viewTwoXTwo: UIView!
    @IBOutlet weak var labelTwoXTwo: UILabel!
    @IBOutlet weak var viewThreeXThree: UIView!
    @IBOutlet weak var labelThreeXThree: UILabel!
    
    
    var whatButton = ""

    
    @IBAction func oneXOne(_ sender: Any) {
        whatButton = "Culture"
        performSegue(withIdentifier: "toTable", sender: sender)
    }
    
    @IBAction func twoXOne(_ sender: Any) {
        whatButton = "Miscellanea"
        performSegue(withIdentifier: "toTable", sender: sender)
    }
    
    @IBAction func threeXOne(_ sender: Any) {
        whatButton = "Museum"
        performSegue(withIdentifier: "toTable", sender: sender)
    }
    
    @IBAction func oneXTwo(_ sender: Any) {
        whatButton = "Fast Food"
        performSegue(withIdentifier: "toTable", sender: sender)
    }
    
    @IBAction func twoXTwo(_ sender: Any) {
        whatButton = "Asian Restaurant"
        performSegue(withIdentifier: "toTable", sender: sender)
    }
    
    @IBAction func threeXThree(_ sender: Any) {
        whatButton = "Restaurant"
        performSegue(withIdentifier: "toTable", sender: sender)
    }

    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()

        
        //Adding format
        viewOneXOne.layer.cornerRadius = 8
        viewOneXOne.layer.borderColor = UIColor.white.cgColor
        viewOneXOne.layer.borderWidth = 0.3
        oneXOne.layer.cornerRadius = 8        
        
        viewTwoXOne.layer.cornerRadius = 8
        viewTwoXOne.layer.borderColor = UIColor.white.cgColor
        viewTwoXOne.layer.borderWidth = 0.3
        twoXOne.layer.cornerRadius = 8
        
        viewThreeXOne.layer.cornerRadius = 8
        viewThreeXOne.layer.borderColor = UIColor.white.cgColor
        viewThreeXOne.layer.borderWidth = 0.3
        threeXOne.layer.cornerRadius = 8
        
        viewOneXTo.layer.cornerRadius = 8
        viewOneXTo.layer.borderColor = UIColor.white.cgColor
        viewOneXTo.layer.borderWidth = 0.3
        oneXTwo.layer.cornerRadius = 8
        
        viewTwoXTwo.layer.cornerRadius = 8
        viewTwoXTwo.layer.borderColor = UIColor.white.cgColor
        viewTwoXTwo.layer.borderWidth = 0.3
        twoXTwo.layer.cornerRadius = 8
        
        viewThreeXThree.layer.cornerRadius = 8
        viewThreeXThree.layer.borderColor = UIColor.white.cgColor
        viewThreeXThree.layer.borderWidth = 0.3
        threeXThree.layer.cornerRadius = 8
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toTable"{

            let tableVC = segue.destination as! TableVC
            tableVC.whatButton = whatButton
        }
    }
}
