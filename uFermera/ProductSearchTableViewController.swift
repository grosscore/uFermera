import UIKit
import Siesta
import SwiftyJSON
import Foundation
import CoreLocation

class ProductSearchTableViewController: UITableViewController, ResourceObserver, UISearchBarDelegate, UISearchControllerDelegate /*UISearchResultsUpdating*/ {
    
    var productsResource: Resource? {
        didSet {
            oldValue?.removeObservers(ownedBy: self)
            oldValue?.cancelLoadIfUnobserved(afterDelay: 0.1)
            
            productsResource?.addObserver(self)
                .addObserver(statusOverlay, owner: self)
                .loadIfNeeded()
        }
    }
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var statusOverlay = ResourceStatusOverlay()
    
    func resourceChanged(_ resource: Resource, event: ResourceEvent) {
        let newProducts: [Product] = productsResource?.jsonDict["products"] as! [Product]? ?? []
        products.append(contentsOf: newProducts)
    }
    
     var products: [Product] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statusOverlay.embed(in: self)
        
        //show local products
        if CLLocationManager.locationServicesEnabled() && CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            if let userCoordinates = appDelegate.locationManager.location?.coordinate {
                    productsResource = uFermeraAPI.firstResource.withParam("lat", String(userCoordinates.latitude)).withParam("lon", String(userCoordinates.longitude))
            }
        } else {
            if let locale = Locale.current.regionCode {
                productsResource = uFermeraAPI.firstResource.withParam("country_code", locale)
            }
        
        }
        
        //search part implementation
        
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        
        self.searchController.dimsBackgroundDuringPresentation = false
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.navigationItem.titleView = searchController.searchBar
        
        self.definesPresentationContext = true
        
        //remove backbutton label
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
//------------------------- MARK: - Table view data source ---------------------------------------------------------

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return products.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)
        if let cell = cell as? ProductTableViewCell {
            cell.product = products[indexPath.row]
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastCell = products.count - 1
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        tableView.tableFooterView = activityIndicator
        if indexPath.row == lastCell {
            activityIndicator.startAnimating()
            let url = productsResource?.jsonDict["next"] as! String?
            if url != nil {
                productsResource = productsResource?.optionalRelative(url)
                activityIndicator.stopAnimating()
                
            }
        }
    }
    
//---------------------- MARK: - Search protocols implementation ------------------------------------------------------------
    
    var searchController = UISearchController(searchResultsController: nil)
    var searchString = ""
    
    func updateSearchResults(for searchController: UISearchController) {
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchString = searchController.searchBar.text!
        if !searchString.isEmpty {
            products.removeAll()
            productsResource = productsResource!.withParam("q", searchString)
        }
        
        searchController.searchBar.resignFirstResponder()
    }

//---------------------- MARK: - Navigation ---------------------------------------------------------------------------------
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProductDetails" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! ProductDetailsTableViewController
                destinationController.product = products[indexPath.row]
            }
        }
        
        
        searchController.searchBar.resignFirstResponder()
    }
}
