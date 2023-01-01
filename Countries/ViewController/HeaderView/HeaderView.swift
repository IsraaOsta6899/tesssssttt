//
//  HeaderView.swift
//  Countries
//
//  Created by Israa Usta on 11/12/2022.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var lblHeader: UILabel!
    weak var delegate : HeaderViewPressDelegate?
    var headerId : Int!
    func setup(representable: HeaderTableViewRepresentable ) {
        self.lblHeader.text = representable.headerTitle
        self.headerId = representable.headerId
    }
    
    @IBAction func toggelExpanded(_ sender: Any) {
        self.delegate?.sectionPressed(section: self.headerId)
    }

    /**
     Register view inside table view
     - Parameter tableView: UITableView
     */
    class func registerHeaderView(tableView: UITableView) {
        tableView.register(UINib(nibName: "HeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "header")
    }
    /**
     Get height for the header
     */
    class func getHeight()->CGFloat {
        return UITableView.automaticDimension
    }
    
    /**
     Get ReuseIdentifier for the header
     */
    class func getReuseIdentifier()->String {
        return "header"
    }
}
