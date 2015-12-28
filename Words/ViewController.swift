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
        
        PFTwitterUtils.logInWithBlock { (user:PFUser?, error:NSError?) -> Void in
            if user == nil {
                print("Problem...")
            } else {
                
                let url = NSURL(string: "https://api.twitter.com/1.1/account/verify_credentials.json")
                let request = NSMutableURLRequest(URL: url!)
                PFTwitterUtils.twitter()?.signRequest(request)
                
                NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
                    do {
                    let responseDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves)
                        let imageURL = responseDictionary["profile_image_url_https"] as! String
                        let name = responseDictionary["name"] as! String
                        
                        user!.setObject(imageURL, forKey: "imageURL")
                        user!.saveInBackground()
                    } catch {}
                }).resume()
                
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
        }
    }

}

