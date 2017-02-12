//
//  PreviousClientsViewController.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/4/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit
import Firebase

class PreviousClientsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var clientData = [String]()
    
    //var ref: FIRDatabaseReference!
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var clientDetails: UITextField!
    
    
    @IBAction func cancelButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func addClient(_ sender: Any) {
        
        if (clientDetails.text?.characters.count)! > 0 {
            
            clientData.append(clientDetails.text!)
     
            //save to firebase
            clientDetails.text = nil
            
            appendValues(values: ["previous_clients" : clientData as AnyObject])
     
        }
      
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return clientData.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! PreviousClientTableViewCell
        
        let currentItem = clientData[indexPath.row]
        
        cell.conFigureCell(inputName: currentItem)
        
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let developer = CurrentUser()
        
        developer.userAttributes { (Developer) in
            
            if let clients = Developer.previousClients {
                
                self.clientData = clients
                self.tableView.reloadData()
            }
            
            
        }
        
//        ref = FIRDatabase.database().reference()
//        
//        let user = FIRAuth.auth()?.currentUser
//        
//        self.ref.child(users).child((user?.uid)!).observe(.value, with: { (snapshot) in
//            
//            let value = snapshot.value as? NSDictionary
//            guard let currentUsers = value?[PREVIOUSCLIENTS] else {return}
//            
//            var newArray = [String]()
//            
//            for user in currentUsers as! NSArray {
//                
//                if user is String {
//                    
//                   newArray.append(user as! String)
//                    
//                }
//                
//               
//                
//            }
//            
//            self.clientData = newArray
//            self.tableView.reloadData()
//            
//            
//        })
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
