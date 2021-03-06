//
//  ListViewController.swift
//  Words
//
//  Created by Eric Schulz on 12/14/15.
//  Copyright © 2015 Eric Schulz. All rights reserved.
//

import UIKit
import Parse

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var wordPosts = [PFObject]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    
    override func viewDidAppear(animated: Bool) {
        updateWordPosts()
    }
    
    func updateWordPosts() {
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.findObjectsInBackgroundWithBlock { (wordPosts:[PFObject]?, error:NSError?) -> Void in
            if error == nil {
                self.wordPosts = wordPosts as [PFObject]!
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.wordPosts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("wordCell") as! WordPostTableViewCell
        let wordPost = self.wordPosts[indexPath.row]
        let user = wordPost["user"] as! PFUser

        cell.postLabel.text = wordPost["post"] as? String
        
//        let url = user["imageURL"] as! String
//        let imageData = NSData(contentsOfURL: NSURL(string: url)!)
//        if imageData == nil {
//            cell.userImageView.image = UIImage()
//        } else {
//            cell.userImageView.image = UIImage(data: imageData!)
//        }
        
        return cell
    }

}
