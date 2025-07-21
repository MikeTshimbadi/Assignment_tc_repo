//
//  ViewController.swift
//  CountryApiProg
//
//  Created by Mike Tshimbadi on 5/26/25.
//

import UIKit

protocol CountryViewControllerProtocol: AnyObject {
    func refreshUI()
    func didFetchCountries(countries: [Country])
}

class CountryViewController: UIViewController {
    
    weak var coordinator: Coordinator?
    var countries: [Country] = []
    let networkManager = NetworkManager()

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        networkManager.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CountryTableViewCell.self, forCellReuseIdentifier: "CountryTableViewCell")
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(tableView)
        setupTableView()
        networkManager.doApi()
        refreshUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshUI()
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

extension CountryViewController: CountryViewControllerProtocol {
    func didFetchCountries(countries: [Country]) {
        self.countries = countries
        refreshUI()
    }
    
    func refreshUI() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

extension CountryViewController:UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as? CountryTableViewCell
        
        cell?.nameLabel.text = countries[indexPath.row].name
        cell?.capitalLabel.text = countries[indexPath.row].capital
        cell?.codeLabel.text = countries[indexPath.row].code
        
        return cell ?? UITableViewCell()
    }
    
}
