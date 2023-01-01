//
//  TitleTableViewCell.swift
//  Countries
//
//  Created by Israa Usta on 08/12/2022.
//

import UIKit

//TitleTableViewCell
class TitleTableViewCell: UITableViewCell {
    
    /// Title label
    @IBOutlet weak var titleLabel: UILabel!
    
    /**
     Awake from nib
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel.textColor = .red
        self.titleLabel.font = .italicSystemFont(ofSize: 18)
    }
    
    /** Setup
    - Parameter representable: Cells protocole
     */
    func setup(representable: TitleTableViewCellRepresentable) {
        self.titleLabel.text = representable.title
    }
    
    /**
     Get height for the cell
     */
    class func getHeight()->CGFloat {
        return UITableView.automaticDimension
    }
    
    /**
     Get ReuseIdentifier for the cell
     */
    class func getReuseIdentifier()->String {
        return "CodeDial"
    }
}
