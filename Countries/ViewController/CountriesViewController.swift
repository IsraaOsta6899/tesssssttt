//
//  TableViewController.swift
//  Countries
//
//  Created by Israa Usta on 08/12/2022.
//

import UIKit
/// countries view controller
class CountriesViewController: UIViewController {
    
    /// viewModel instance for countries view controller
    var viewModel: CountryViewModel!
    
    /// outlet for countries table view
    @IBOutlet weak var countryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTableView()
        self.viewModel = CountryViewModel()
        self.fetchData()
        
    }
    
    /**
     Fetch data
     */
    func fetchData() {
        CountriesModel.getCountries {
            result in
            switch result {
            case .failure(_):
                break
            case .success(let countries):
                self.viewModel.setCountries(countries: countries)
                self.countryTableView.reloadData()

            }
            self.countryTableView.refreshControl?.endRefreshing()
        }
        
    }
    
    /**
     Setup table view
     */
    func setUpTableView() {
        self.countryTableView.delegate = self
        self.countryTableView.dataSource = self
        HeaderView.registerHeaderView(tableView: self.countryTableView)
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(getData), for: .valueChanged)
        self.countryTableView.refreshControl = refreshControl
    }
    
    @objc func getData(refreshControl: UIRefreshControl) {
        self.fetchData()
    }
}
