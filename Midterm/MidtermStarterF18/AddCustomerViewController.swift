//
//  AddCustomerViewController.swift
//  MidtermStarterF18
//
//  Created by parrot on 2018-11-14.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import CoreData

class AddCustomerViewController: UIViewController {
    
    var context:NSManagedObjectContext!
    
    // MARK: Outlets
    // ---------------------
    @IBOutlet weak var nameTextBox: UITextField!
    @IBOutlet weak var startingBalanceTextBox: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var CustId: UILabel!
    
     var x:String = ""
    
    // MARK: Default Functions
    // ---------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        // HINT HINT HINT HINT HINT
        // HINT HINT HINT HINT HINT
        // Setup your CoreData variable
        // ----------------------------------------
        
        // 1. Mandatory - copy and paste this
        // Explanation: try to create/initalize the appDelegate variable.
        // If creation fails, then quit the app
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        // 2. Mandatory - initialize the context variable
        // This variable gives you access to the CoreData functions
        self.context = appDelegate.persistentContainer.viewContext
        
        
        // Code to create a random 4 digit string
       
        repeat {
            // Create a string with a random number 0...9991
            x = String(format:"%04d", arc4random_uniform(9992) )
        } while x.count < 4
        
        print("Random value: \(x)")
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: Actions
    // ---------------------
    
    @IBAction func createAccountPressed(_ sender: Any) {
        print("you pressed the create account button!")
        
        // Create the "row" you want to insert into the database
        // When using CoreData, you don't do a SQL statment
        // You create an OBJECT, and then insert the OBJECT
        
        // Below code is equivalent of:
        //      INSERT INTO User(email, password) VALUES ("michael@gmail.com", "1234")
        let c = Customer(context: self.context)
        c.name = nameTextBox.text!
        c.balance = startingBalanceTextBox.text!
        c.customerId = x
        
        do {
            // Save the user to the database
            // (Send the INSERT to the database)
            try self.context.save()
            print("Saved to database!")
            messageLabel.text = "Customer Created"
            CustId.text = "Customer ID = \(x)"
            
        }
        catch {
            print("Error while saving to database")
            messageLabel.text = "Customer Faild"
            CustId.text = "Sorry..!!"
        }    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
