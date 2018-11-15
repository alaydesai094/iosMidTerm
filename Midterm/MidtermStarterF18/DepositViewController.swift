//
//  DepositViewController.swift
//  MidtermStarterF18
//
//  Created by parrot on 2018-11-14.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import CoreData

class DepositViewController: UIViewController {

     var context:NSManagedObjectContext!
    
    // MARK: Outlets
    // ---------------------
    @IBOutlet weak var customerIdTextBox: UITextField!
    @IBOutlet weak var balanceLabel: UILabel!

    @IBOutlet weak var depositAmountTextBox: UITextField!
    @IBOutlet weak var messagesLabel: UILabel!
    
    // MARK: Default Functions
    // ---------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        print("You are on the Check Balance screen!")
        
        // Setup your CoreData variable
        // ----------------------------------------
        
        // 1. Mandatory - copy and paste this
        // Explanation: try to create/initalize the appDelegate variable.
        // If creation fails, then quit the app
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        // 2. Mandatory - initialize the context variable
        // This variable gives you access to the CoreData functions
        self.context = appDelegate.persistentContainer.viewContext
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    // MARK: Actions
    // ---------------------
    
    
    @IBAction func checkBalancePressed(_ sender: Any) {
        print("check balance button pressed!")
        
        // This is the same as:  SELECT * FROM User
        
        //SELECT * FROM User
        let fetchRequest:NSFetchRequest<Customer> = Customer.fetchRequest()
        
        fetchRequest.predicate =  NSPredicate(format: "customerId == %@", "\(customerIdTextBox.text!)")
        
        // SQL: SELECT * FROM User WHERE email="jeenlle@gmil.com"
        
        do {
            // Send the "SELECT *" to the database
            //  results = variable that stores any "rows" that come back from the db
            // Note: The database will send back an array of User objects
            // (this is why I explicilty cast results as [User]
            let results = try self.context.fetch(fetchRequest) as [Customer]
            
            // Loop through the database results and output each "row" to the screen
            print("Number of items in database: \(results.count)")
            
            for x in results {
                print("Customer ID: \(String(describing: x.customerId))")
                print("Customer Name: \(String(describing: x.name))")
                print("Customer balance: \(String(describing: x.balance))")
                balanceLabel.text = "Your Balance : \(String(describing: x.balance))"
                
                
            }
        }
        catch {
            print("Error when fetching from database")
        }
        
        
        
        
        
    }
    
    
    @IBAction func depositButtonPressed(_ sender: Any) {
        print("you pressed the deposit button!")
        
            // This is the same as:  SELECT * FROM User
        
        //SELECT * FROM User
        let fetchRequest:NSFetchRequest<Customer> = Customer.fetchRequest()
        
        fetchRequest.predicate =  NSPredicate(format: "customerId == %@", "\(customerIdTextBox.text!)")
        
        // SQL: SELECT * FROM User WHERE email="jeenlle@gmil.com"
        
        do {
            // Send the "SELECT *" to the database
            //  results = variable that stores any "rows" that come back from the db
            // Note: The database will send back an array of User objects
            // (this is why I explicilty cast results as [User]
            let results = try self.context.fetch(fetchRequest) as [Customer]
            
            // Loop through the database results and output each "row" to the screen
            print("Number of items in database: \(results.count)")
            
            for x in results {
                print("Customer ID: \(String(describing: x.customerId))")
                print("Customer Name: \(String(describing: x.name))")
                print("Customer balance: \(String(describing: x.balance))")
                
                var bal:Int? = Int(x.balance!)
                var dep:Int? = Int(depositAmountTextBox.text!)
               
                var newbal = (bal!+dep!)
                
               // messagesLabel.text = "Your New Balance : \(String(describing: x.balance))"
                messagesLabel.text = "Your New Balance : \(newbal))"
            }
        }
        catch {
            print("Error when fetching from database")
        }
        
        
        
        
    }
    
    
    @IBAction func showCustomersPressed(_ sender: Any) {
        print("Show customers button pressed!")
        
        // This is the same as:  SELECT * FROM User
        
        //SELECT * FROM User
        let fetchRequest:NSFetchRequest<Customer> = Customer.fetchRequest()
        
        //fetchRequest.predicate =  NSPredicate(format: "customerId == %@", "\(customerIdTextBox.text!)")
        
        // SQL: SELECT * FROM User WHERE email="jeenlle@gmil.com"
        
        do {
            // Send the "SELECT *" to the database
            //  results = variable that stores any "rows" that come back from the db
            // Note: The database will send back an array of User objects
            // (this is why I explicilty cast results as [User]
            let results = try self.context.fetch(fetchRequest) as [Customer]
            
            // Loop through the database results and output each "row" to the screen
            print("Number of items in database: \(results.count)")
            
            for x in results {
                print("Customer ID: \(String(describing: x.customerId))")
                print("Customer Name: \(String(describing: x.name))")
                print("Customer balance: \(String(describing: x.balance))")
                
                
            }
        }
        catch {
            print("Error when fetching from database")
        }
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
