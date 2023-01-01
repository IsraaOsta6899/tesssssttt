//
//  TableViewSectionRepresentable.swift
//  Countries
//
//  Created by Israa Usta on 08/12/2022.
//

import Foundation
class SectionTableViewRepresentable {
    /// header representable
     var headerRepresentable: HeaderTableViewRepresentable?
    
    /// cells representabels as [CellsProtocole]
     var cellsRepresentable: [CellsProtocole] = []
    
    /// is Expanded as bool
     var isExpanded : Bool = false
}
