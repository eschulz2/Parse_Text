//
//  PostViewController.swift
//  Words
//
//  Created by Eric Schulz on 12/14/15.
//  Copyright © 2015 Eric Schulz. All rights reserved.
//

import UIKit
import Parse

class PostViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.errorLabel.text = ""
        self.textField.becomeFirstResponder()
    }

    @IBAction func cancelTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func postTapped(sender: AnyObject) {
        if self.textField.text!.isEmpty{
            self.errorLabel.text = "Enter a text before posting"
        } else {
            //post up
            self.errorLabel.text = ""
            createPost()
        }
    }
    
    func createPost(){
        let post = PFObject(className: "Post")
        post.setObject(self.textField.text!, forKey: "post")
        post.setObject(PFUser.currentUser()!, forKey: "user")
        
        post.saveInBackgroundWithBlock { (saved:Bool, error:NSError?) -> Void in
            if saved {
                self.dismissViewControllerAnimated(true, completion: nil)
            } else {
                self.errorLabel.text = "Upload Error"
            }
        }
    }

}
