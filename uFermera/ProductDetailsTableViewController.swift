//
//  ProductDetailsTableViewController.swift
//  uFermera
//
//  Created by Alex Gnilov on 7/18/17.
//  Copyright © 2017 uFermera. All rights reserved.
//
import Siesta
import UIKit

class ProductDetailsTableViewController: UITableViewController {
    
    @IBOutlet weak var image: RemoteImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var productDescr: UILabel!
    @IBOutlet weak var location: UILabel!
    
    var product: Product?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clearsSelectionOnViewWillAppear = false
        
        //Clear empty rows' separators
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 50))
        
        image?.placeholderImage = UIImage(named: "nophoto")
        image?.imageURL = product?.fullsizePhotoURL
    
        name.text = product?.name
        productDescr.text = product?.description
        location.text = product?.location
        price.text = "\(product?.price ?? "") \(product?.currency ?? "у.е") за \(product?.unit ?? "")"
        price.text = price.text?.replacingOccurrences(of: ".00", with: "")
        
        //Auto-resizing cells
        tableView.estimatedRowHeight = 150.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    /*
     //MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cell
    }
     */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
