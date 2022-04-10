//
//  TableVC+longPress.swift
//  MyWorld
//
//  Created by user143594 on 12/6/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import UIKit


extension TableVC{
       
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPress(longPressGestureRecognizer:)))
        tableView.addGestureRecognizer(longPress)
    }
    
    
    @objc func longPress(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        
        if longPressGestureRecognizer.state == UIGestureRecognizer.State.began {            
            let touchPoint = longPressGestureRecognizer.location(in: self.view)
            
            if let indexPath = tableView.indexPathForRow(at: touchPoint) {
                let alert = UIAlertController(title: "", message: "Estas segur que vols esborrar la localització seleccionada?", preferredStyle: UIAlertController.Style.alert)
                
                let accept = UIAlertAction(title: "Esborrar localització", style: UIAlertAction.Style.default) { (action) in
                    self.places.removeFromPosition(indexPath.item)
                    self.places.saveJsonToFile(origin: self.places.places)
                    self.tableView.reloadData()
                }
                
                let cancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) { (action) in
                    print("Blue action button tapped")
                }
                
                alert.addAction(accept)
                alert.addAction(cancel)
                
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}
