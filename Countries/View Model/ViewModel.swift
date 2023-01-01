//
//  ViewModel.swift
//  Countries
//
//  Created by Israa Usta on 08/12/2022.
//

import Foundation
import UIKit

/// Country view model
class CountryViewModel{
    
    /// countries
    private var countries: [Country]
    
    /// Expanded Sections
    private var expandedSections : Set<String>
    
    /// Representable
    private var representables: [SectionTableViewRepresentable]
    
    init() {
        self.countries = []
        self.representables = []
        self.expandedSections = []
        let x = SectionTableViewRepresentable()
        x.cellsRepresentable.append(LoadingTableViewCellRepresentable())
        x.isExpanded = true
        self.representables.append(x)
    }
    
    /**
     Set countries.
     */
    func setCountries(countries:[Country]){
        self.countries = countries
        buildRepresentable()
    }
    
    /**
     Build representable.
     */
    private func buildRepresentable() {
        self.representables.removeAll()
        for (index , country) in self.countries.enumerated() {
            let sectionRepresentable = SectionTableViewRepresentable()
            sectionRepresentable.headerRepresentable = HeaderTableViewRepresentable(countryName: country.name , headerId: index)
            sectionRepresentable.cellsRepresentable.append(TitleTableViewCellRepresentable(title: country.code))
            sectionRepresentable.cellsRepresentable.append(TitleTableViewCellRepresentable(title: country.dialCode ?? ""))
            self.representables.append(sectionRepresentable)
            if self.expandedSections.contains(country.name){
                sectionRepresentable.isExpanded = true
            }
        }
    }
    
    /**
     Get number of  sections.
     - Returns: Number of sections as Int.
     */
    func numberOfSections() -> Int {
        return self.representables.count
    }
    
    /**
     Get number of rows in each section.
     - Parameter section: Section number as Int.
     - Returns: Number of rows in section as Int.
     */
    func numberOfRows(inSection section: Int) -> Int {
        if section < representables.count && representables[section].isExpanded{
            return self.representables[section].cellsRepresentable.count
        }else{
            return 0
        }
    }
    
    /**
     Get height for each row in the table.
     - Parameter indexPath: Index path.
     - Parameter tableView: Table View.
     - Returns: height of cell as CGFloat.
     */
    func heightForRow(at indexPath: IndexPath, tableView: UITableView) -> CGFloat {
        if let representable = representableForRow(at: indexPath) {
            if let titleTableViewCellRepresentable = representable as? TitleTableViewCellRepresentable{
                return titleTableViewCellRepresentable.cellHeight
            }else if representable is LoadingTableViewCellRepresentable {
                return LoadingTableViewCell.getHeight(tableview: tableView)
            }
        }
        return 0
    }
    
    /**
     Get cell representable at indexPath
     - Parameter indexPath: Index path.
     - Returns: Cell representable as TableViewCellRepresentable.
     */
    func representableForRow(at indexPath: IndexPath) -> CellsProtocole? {
        if self.representables.count > indexPath.section && self.representables[indexPath.section].cellsRepresentable.count > indexPath.row{
            return self.representables[indexPath.section].cellsRepresentable[indexPath.row]
        }else{
            return nil
        }
    }
    
    /**
     Get representableForHeader at section
     - Parameter indexPath: Index path.
     - Returns: Header Representable for section as HeaderTableViewRepresentable.
     */
    func representableForHeader(at section: Int) -> HeaderProtocole? {
        if self.representables.count > 0{
            return self.representables[section].headerRepresentable
        }else{
            return nil
        }
        
    }
    
    /**
     Get height for header for section in the table.
     - Returns: height of header as CGFloat.
     */
    func heightForHeaderInSection(at section: Int , tableView: UITableView )->CGFloat {
        return representableForHeader(at: section)?.headerHeight ?? 0
    }
    
    func sectionPressed(section: Int) {
        if section < self.representables.count{
            self.representables[section].isExpanded = !self.representables[section].isExpanded
            var country = self.countries[representables[section].headerRepresentable?.headerId ?? 0]
            if self.representables[section].isExpanded{
                self.expandedSections.insert(country.name)
            }else{
                self.expandedSections.remove(country.name)
            }
        }
    }
}
