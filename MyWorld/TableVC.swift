//
//  TableVC.swift
//  MyWorld
//
//  Created by user143594 on 11/12/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import UIKit


class TableVC: UITableViewController {

    let places = PlaceManager.shared
    var refresh = false
    var whatButton = ""
    //var filteredCells = [Place]()
    
    
    //MARK: -----------------------------------Refresh
    //*
    override func viewWillAppear(_ animated: Bool) {
        
        places.sortPlaces (whattButton: whatButton)
        
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool){
        
        if refresh == true {
            
            self.tableView.reloadData()
            //places.sortPlaces (whattButton: whatButton)
            
            //self.places.saveJsonToFile(origin: self.places.places)
            //self.tableView.reloadData()
        }
        
        
        
        //places.sortPlaces (whattButton: whatButton)
        //self.tableView.reloadData()
        
        //dump (places.places)
        //print ("WhatButton --> \(whatButton)")
        //self.places.saveJsonToFile(origin: self.places.places)
        
        
    }
    
    
    // MARK: --------------------------------- Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return places.count()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath) as! PlaceCell
//        let place = places.itemAt(position: indexPath.item)
//        
//        cell.nameLabel.text = place?.name
//        cell.iconTable.image = UIImage(named: (place?.iconTable)!)
        
        if (places.filteredByIcon(position: indexPath.item, whattButton: whatButton)) {


            let place = places.itemAt(position: indexPath.item)

            cell.nameLabel.text = place?.name
            cell.iconTable.image = UIImage(named: (place?.iconTable)!)
        }
        else {

            cell.isHidden = true
        }

        refresh = true
        
        return cell
        
    }
 
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    }
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        if !(places.filteredByIcon(position: indexPath.item, whattButton: whatButton)) {
//            return 0
//        }
//        else { return UITableView.automaticDimension }
//    }
    
    
    // MARK: --------------------------------- Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetail" {
            let cell = sender as! PlaceCell
            let index = tableView.indexPath(for: cell)!.row
            let place = places.places[index]
            let elementDetailVC = segue.destination as! DetailVC
            elementDetailVC.place = place
        }
    }
}
