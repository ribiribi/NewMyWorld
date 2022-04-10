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
    
    
    //MARK: -----------------------------------Refresh
    
    //*
    override func viewWillAppear(_ animated: Bool) {
        
        places.sortPlaces (whattButton: whatButton)
        
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool){
        
        if refresh == true {
            
            self.tableView.reloadData()
        }
    }
    
    
    // MARK: --------------------------------- Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return places.count()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath) as! PlaceCell
        
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
