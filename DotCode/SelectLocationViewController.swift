//
//  SelectLocationViewController.swift
//  ObjectiveCApp
//
//  Created by Aileen Taboy on 1/17/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit
import MapKit
import Alamofire
import SwiftyJSON


class SelectLocationViewController: UIViewController {
    
    var arrRes = [[String:AnyObject]]()

    let GoogleMapKey = "AIzaSyA4BgeYk7lwZ33Ej6QbBGVEN6ardkQ6xH0"
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet var tableView: UITableView!
    
   //var locatons = [String]()
    
    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.isNavigationBarHidden = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationController?.isToolbarHidden = true
        
        searchBar.delegate = self
        self.searchBar.endEditing(true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override var prefersStatusBarHidden: Bool {
        
        return true
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "dev" {
            
        }
        
      
    }
 

}

extension SelectLocationViewController: UISearchBarDelegate {
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
//        let localSearhRequest = MKLocalSearchRequest()
//        localSearhRequest.naturalLanguageQuery = searchBar.text
//        
//       let localSearch = MKLocalSearch(request: localSearhRequest)
//        
//        if localSearch.isSearching {
//            localSearch.cancel()
//        } else {
//            
//            localSearch.start(completionHandler: { (response, error) in
//                guard let results = response else { return }
//                
//                var forLocations = [String]()
//                
//                for mapItem in results.mapItems {
//                    
//                    let cpMark = mapItem.placemark as CLPlacemark
//                    let addressAtributes = cpMark.addressDictionary
//                    
//                    if let city = addressAtributes?["City"], let state = addressAtributes?["State"] {
//                        
//                        let locationToAdd = "\(city), \(state)"
//                        
//                        
//                        forLocations.append(locationToAdd)
//                    }
//                    
//                    
//                    
//                }
//                
//                self.locatons = forLocations
//                self.tableView.reloadData()
// 
//            })
//        }
        
        let url:String = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=" + searchText + "&types=(cities)&key=" + GoogleMapKey
        
        Alamofire.request(url).responseJSON { (responseData) in
            if responseData.result.value != nil {
                let swiftyJsonVar = JSON(responseData.result.value!)
                if let resData = swiftyJsonVar["predictions"].arrayObject{
                    self.arrRes = resData as! [[String:AnyObject]]
                }
            }
            
            
            if self.arrRes.count > 0 {
                
                self.tableView.reloadData()
            }
        }
        
        
    }
    
    
}


//https://maps.googleapis.com/maps/api/place/autocomplete/json?input=aaaaa&types=(cities)&key=AIzaSyA4BgeYk7lwZ33Ej6QbBGVEN6ardkQ6xH0

//Alamofire.request("http://v.juhe.cn/weixin/query?key=07323797eb42a7ef574226355eecf4d6").responseJSON { (responseData) in
//    if responseData.result.value != nil {
//        let swiftyJsonVar = JSON(responseData.result.value!)
//        if let resData = swiftyJsonVar["result"]["list"].arrayObject{
//            self.arrRes = resData as! [[String:String]]
//        }
//    }
//    
//    if self.arrRes.count > 0 {
//        self.myTableView.reloadData()
//    }
//}





extension SelectLocationViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var dict = arrRes[indexPath.row]
        
       
        cell.textLabel?.text = dict["description"] as! String
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var dict = arrRes[indexPath.row]
        
        let location = dict["description"] as! String
        
        appendValues(values: [USERLOCATION : location as AnyObject] )
        
        self.performSegue(withIdentifier: "dev", sender: self)
   
        
    }
    
    
}



















