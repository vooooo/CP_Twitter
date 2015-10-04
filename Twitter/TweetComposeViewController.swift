//
//  TweetComposeViewController.swift
//  Twitter
//
//  Created by vu on 10/2/15.
//  Copyright © 2015 CodePath. All rights reserved.
//

import UIKit

class TweetComposeViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var screennameLabel: UILabel!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var charCountLabel: UILabel!
    
    @IBOutlet weak var tweetTextView: UITextView!
    
    @IBAction func doTweet(sender: UIBarButtonItem) {
        print("Submitting Tweet")
        
    }
    
    var tweet: Tweet!

    override func viewDidLoad() {
        super.viewDidLoad()
        if tweet != nil {
//            nameLabel.text = tweet.user!.name
//            profileImageView.setImageWithURL(NSURL(string: tweet.user!.profileImageUrl!))
//            screennameLabel.text = "@\(tweet.user!.screenname!)"
            nameLabel.text = User.currentUser?.name
            profileImageView.setImageWithURL(NSURL(string: User.currentUser!.profileImageUrl!))
            screennameLabel.text = "@\(User.currentUser!.screenname!)"
        } else {
            nameLabel.text = User.currentUser?.name
            profileImageView.setImageWithURL(NSURL(string: User.currentUser!.profileImageUrl!))
            screennameLabel.text = "@\(User.currentUser!.screenname!)"
        }
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
