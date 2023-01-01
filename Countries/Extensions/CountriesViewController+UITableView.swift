//
//  CountriesViewController+UITableView.swift
//  Countries
//
//  Created by Israa Usta on 10/12/2022.
//

import UIKit
extension CountriesViewController: UITableViewDelegate, UITableViewDataSource , HeaderViewPressDelegate {
    
    
    
    /**
     Get number of  sections from viewModel.
     - Returns: Number of sections as Int.
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.numberOfSections()
    }
    /**
     Get number of rows in each section .
     - Parameter section: Section number as Int.
     - Parameter tableView: Table View as UITableView.
     - Returns: Number of rows in section as Int.
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows(inSection: section)
    }
    
    /**
     Get cell  at indexPath
     - Parameter indexPath: Index path.
     - Parameter tableView: Table View as UITableView.
     - Returns: Cell  as UITableViewCell.
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let representable = self.viewModel.representableForRow(at: indexPath)
        if let codeCellTableViewRepresentable = representable as? TitleTableViewCellRepresentable {
            let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.getReuseIdentifier(), for: indexPath) as! TitleTableViewCell
            cell.setup(representable: codeCellTableViewRepresentable)
            return cell
            
        }else if let loadingCellTableViewRepresentable = representable as? LoadingTableViewCellRepresentable {
            let cell = tableView.dequeueReusableCell(withIdentifier: loadingCellTableViewRepresentable.reuseIdentifier, for: indexPath)
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    
    /**
     Get cell height at indexPath
     - Parameter indexPath: Index path.
     - Returns: Cell height  as CGFloat.
     */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.viewModel.heightForRow(at: indexPath, tableView: tableView)
    }
    
    /**
     Get header view at section
     - Parameter section: Section number as Int.
     - Parameter tableView: Table View as UITableView.
     - Returns: header view as UIView?
     */
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let representable = self.viewModel.representableForHeader(at:section ) as! HeaderTableViewRepresentable
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! HeaderView
        headerView.setup(representable: representable)
        headerView.delegate = self
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        self.viewModel.heightForHeaderInSection(at: section, tableView: tableView)
    }
    
    
    func sectionPressed(section: Int) {
        self.viewModel.sectionPressed(section: section)
        self.countryTableView.reloadData()
    }
    
}
