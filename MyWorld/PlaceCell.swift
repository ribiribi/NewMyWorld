//
//  PlaceCell.swift
//  MyWorld
//
//  Created by user143594 on 11/12/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import UIKit


class PlaceCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconTable: UIImageView!
    @IBOutlet weak var colorBackgroundView: UIView!{
        
        didSet {
            colorBackgroundView.layer.cornerRadius = 8
        }
    }
    
    
    @IBOutlet weak var colorBackgroundArrowView: UIView!{
        didSet {
            colorBackgroundArrowView.layer.cornerRadius = 8
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
