//
//  HomePageViewController.swift
//  ProductObjectDisplay
//
//  Created by Mike Tshimbadi on 4/24/25.
//

import UIKit

    struct Product {
        let name: String
        let price: String
        let image: String

        init(name: String, price: String, image: String) {
            self.name = name
            self.price = price
            self.image = image
        }
    }

class HomePageViewController: UIViewController, UITableViewDataSource {
    
    
    let product = [
        Product(name:"Apple", price: "$1.99", image: "red"),
        Product(name:"Banana", price: "$2.99", image: "green"),
        Product(name:"Orange", price: "$3.99", image: "yellow"),
        Product(name:"Mango", price: "$4.99", image: "purple"),
        Product(name:"Pineapple", price: "$5.99", image: "blue"),
        Product(name:"lemon", price: "$6.99", image: "brown"),
        Product(name:"Peach", price: "$7.99", image: "black"),
        Product(name:"Strawberry", price: "7.99", image: "mangeta"),
        Product(name:"Grepes", price: "$7.99", image: "grey"),
        Product(name:"Avocado", price: "$10.99", image: "white")
        
    ]
    
    let StringToUIColor = [
        "red": UIColor.red,
        "green": UIColor.green,
        "yellow": UIColor.yellow,
        "purple": UIColor.purple,
        "blue": UIColor.blue,
        "brown": UIColor.brown,
        "black": UIColor.black,
        "magenta": UIColor.magenta,
        "gray": UIColor.gray,
        "white": UIColor.white
        
    ]
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "Product \(indexPath.row)"
        return cell
        
        
    }

}
