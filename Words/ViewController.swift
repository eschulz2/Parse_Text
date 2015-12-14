//
//  ViewController.swift
//  Words
//
//  Created by Eric Schulz on 12/14/15.
//  Copyright © 2015 Eric Schulz. All rights reserved.
//

import UIKit
import Parse
import ParseTwitterUtils

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    }

    @IBAction func twitterTapped(sender: AnyObject) {
        
        PFTwitterUtils.initializeWithConsumerKey("ekgXQ5HWtv6DTfQTIg8yuZAF7", consumerSecret: "gXHLkSk5pejwoyjWw9OBfutZU1pYJBiuOyione99bcx7likVL4")
    }

}

