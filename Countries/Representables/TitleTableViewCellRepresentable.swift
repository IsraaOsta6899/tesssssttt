//
//  TitleTableViewCellRepresentable.swift
//  Countries
//
//  Created by Israa Usta on 08/12/2022.
//

import Foundation
class TitleTableViewCellRepresentable: CellsProtocole {
        
    /// Title
    private(set) var title: String

    /// Cell height
    var cellHeight: CGFloat
    
    /// Reuse identifier
    var reuseIdentifier: String
    
    /**
      init without parameters.
     */
    init() {
        self.title = ""
        self.cellHeight = TitleTableViewCell.getHeight()
        self.reuseIdentifier = TitleTableViewCell.getReuseIdentifier()
    }
    
    /**
       init.
     - Parameter Title: title as string.
     */
    convenience init(title: String) {
        self.init()
        self.title = title
    }
}
