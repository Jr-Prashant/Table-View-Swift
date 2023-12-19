//
//  CellTableViewCell.swift
//  TableViewApp
//
//  Created by MacBook Pro on 28/11/23.
//

import UIKit

class CellTableViewCell: UITableViewCell {
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Set the desired height and width
        let viewSize: CGFloat = 80.0 // You can change this to your desired size
        
        self.titleView.frame = CGRectMake(self.titleView.frame.origin.x, self.titleView.frame.origin.y, viewSize, viewSize);

        // Make it round
        self.titleView.layer.cornerRadius = viewSize / 2.0;
        self.titleView.layer.masksToBounds = true;

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
