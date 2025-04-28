//
//  HomePageViewController.swift
//  CellColor
//
//  Created by Mike Tshimbadi on 4/24/25.
//

import UIKit

class HomePageViewController: UIViewController, UITableViewDataSource {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
//        imageView.dataSource = self
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.row % 3 == 0 {
            cell.backgroundColor = UIColor.red
        } else if indexPath.row % 3 == 1{
            cell.backgroundColor = UIColor.green
        } else if indexPath.row % 3 == 2 {
            cell.backgroundColor = UIColor.blue
        } else {
            cell.backgroundColor = UIColor.green
        }

        return cell
//        cell.imageView?.image = UIImage(systemName: "star.fill")?.withRenderingMode(.alwaysTemplate)
//
//        if indexPath.row % 3 == 0 {
//            cell.imageView?.tintColor = .red
//        } else if indexPath.row % 3 == 1{
//            cell.imageView?.tintColor = .green
//        } else if indexPath.row % 3 == 2 {
//            cell.imageView?.tintColor = .blue
//        } else {
//            cell.imageView?.tintColor = .red
//        }
//
//        return cell
    }

    //        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
    //        cell.textLabel?.text = "name \(indexPath.row)"

}
