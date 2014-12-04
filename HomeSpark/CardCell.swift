//
//  CardCell.swift
//  HomeSpark
//
//  Created by Greg Barbosa on 12/3/14.
//  Copyright (c) 2014 gregbarbosa. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var paperSwitch: RAMPaperSwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        cardSetup()
    }
    
    func cardSetup() -> Void {
        cardView.alpha = 1.0
        cardView.layer.masksToBounds = false
        cardView.layer.cornerRadius = 2
        cardView.layer.shadowOffset = CGSizeMake(-0.2, 2)
        cardView.layer.shadowRadius = 1
        var path = UIBezierPath(rect: cardView.bounds)
        cardView.layer.shadowPath = path.CGPath
        cardView.layer.shadowOpacity = 0.12
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        cardView.layer.shadowOffset = CGSizeMake(-0.2, 3)
        cardView.layer.shadowOpacity = 0.12
        
        super.touchesBegan(touches, withEvent: event)
        
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        cardView.layer.shadowOffset = CGSizeMake(-0.2, 2)
        cardView.layer.shadowOpacity = 0.12
        
        super.touchesEnded(touches, withEvent: event)
        
    }
    
}