//
//  CardCell.swift
//  HomeSpark
//
//  Created by Greg Barbosa on 12/3/14.
//  Copyright (c) 2014 gregbarbosa. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func layoutSubviews() {
        cardSetup()
    }
    
    func cardSetup() -> Void {
        cardView.alpha = 1.0
        cardView.layer.masksToBounds = false
        cardView.layer.cornerRadius = 1
        cardView.layer.shadowOffset = CGSizeMake(-0.2, -0.2)
        cardView.layer.shadowRadius = 1
        var path = UIBezierPath(rect: cardView.bounds)
        cardView.layer.shadowPath = path.CGPath
        cardView.layer.shadowOpacity = 0.2
        
    }
}
