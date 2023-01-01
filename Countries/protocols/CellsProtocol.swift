//
//  CellsProtocol.swift
//  Countries
//
//  Created by Israa Usta on 08/12/2022.
//

import Foundation
protocol CellsProtocole {
    //set and get
    /// Cell height
    var cellHeight: CGFloat{ get set }
    
    ///  Reuse identifier
    var reuseIdentifier: String { get set }
}
