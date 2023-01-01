//
//  TableViewHeaderRepresentable.swift
//  Countries
//
//  Created by Israa Usta on 08/12/2022.
//

import Foundation
import UIKit
class HeaderTableViewRepresentable : HeaderProtocole  {

    var headerHeight: CGFloat
    
    var reuseIdentifier: String
    
    var headerId : Int
    
    /// header title (name of country)
    private(set) var headerTitle: String
    
    init(){
        self.headerTitle = ""
        self.headerId = 0
        self.reuseIdentifier = HeaderView.getReuseIdentifier()
        self.headerHeight = HeaderView.getHeight()
    }
    
    /**
     Convenience init.
     - Parameter countryCode: country Code as string.
     */
    convenience init(countryName: String , headerId : Int) {
        self.init()
        self.headerTitle = countryName
        self.headerId = headerId
    }
}
