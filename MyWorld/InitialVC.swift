//
//  InitialVC.swift
//  MyWorld
//
//  Created by user143594 on 12/10/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import UIKit


class InitialVC: UIViewController {

    
    @IBOutlet weak var imageInitialVC: UIImageView!
    @IBOutlet weak var blureView: UIVisualEffectView!
    @IBOutlet weak var welcomeLAbel: UILabel!
    @IBOutlet weak var myWorldLabel: UILabel!
    @IBOutlet weak var worldLabel: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.welcomeLAbel.font = UIFont (name: "Chalkduster", size: 30)
        self.myWorldLabel.font = UIFont (name: "Chalkduster", size: 72)
         self.worldLabel.font = UIFont (name: "Chalkduster", size: 78)
        
        
            
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { timer in
            
            UIView.animate(withDuration: 1.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                self.welcomeLAbel.alpha = 1
                
            }, completion: nil)
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { timer in
                
                UIView.animate(withDuration: 1.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                    self.myWorldLabel.alpha = 1
                    self.worldLabel.alpha = 1
                    self.blureView.alpha = 0.95
                    
                }, completion: nil)
                
                Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { timer in
                    self.performSegue(withIdentifier: "toTabBarController", sender: nil)
            
                }
            }
        }        
    }
}
