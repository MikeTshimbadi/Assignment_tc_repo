//
//  ViewController.swift
//  CountryApp
//
//  Created by Mike Tshimbadi on 7/2/25.
//

import UIKit

protocol CountryViewControllerPotocol: AnyObject {
    func refreshData()
    func didFetchCountries(countries: [Country])
}

class CountryViewController: UIViewController {
    
    var countries: [Country] = []
    let networkManager = NetworkManager()
    let searchController = UISearchController(searchResultsController: nil)
    var filteredCountries: [Country] = []
    var isSearching: Bool {
        return searchController.isActive && !(searchController.searchBar.text!.isEmpty)  // Check if search is active and text is not empty
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false  // for programmatic constraints
        networkManager.delegate = self     // Set the delegate to the current view controller
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension  // Enable dynamic row height
        tableView.estimatedRowHeight = 60
        tableView.register(CountryTableViewCell.self, forCellReuseIdentifier: "CountryTableViewCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(tableView)
        title = "Countries"
        setupTableView()
        networkManager.doApi()
        refreshData()
        setupSearchBar()
    }
    // MARK: - View Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshData()
    }
    
    // search bar setup
    private func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search by Name or Capital"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    

    private func setupTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension CountryViewController: CountryViewControllerPotocol {
    func didFetchCountries(countries: [Country]) {
        self.countries = countries // Update the countries array with the fetched data
        refreshData()
    }
    
    func refreshData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension CountryViewController:UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredCountries.count : countries.count // return count based on search state
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let country = isSearching ? filteredCountries[indexPath.row] : countries[indexPath.row] // Use filteredCountries if searching, otherwise use countries
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as? CountryTableViewCell
        
        cell?.nameLabel.text = country.name
        cell?.regionLabel.text = country.region
        cell?.capitalLabel.text = country.capital
        cell?.codeLabel.text = country.code
        
        return cell ?? UITableViewCell()
    }
    
}

extension CountryViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text?.lowercased(), !query.isEmpty else {
            filteredCountries = []
            tableView.reloadData()
            return
        }

        filteredCountries = countries.filter {
            ($0.name?.lowercased().contains(query) ?? false) || ($0.capital!.lowercased().contains(query))
        }
        tableView.reloadData()
    }
}


