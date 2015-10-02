//
//  TweetsViewController.swift
//  Twitter
//
//  Created by vu on 9/30/15.
//  Copyright © 2015 CodePath. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tweets: [Tweet]?
    var refreshControl: UIRefreshControl!

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func onLogout(sender: AnyObject) {
        User.currentUser?.logout()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "loadTweets", forControlEvents: UIControlEvents.ValueChanged)
        
        let dummyTableVC = UITableViewController()
        dummyTableVC.tableView = tableView
        dummyTableVC.refreshControl = refreshControl
        
        loadTweets()

    }
    
    func loadTweets() {
        TwitterClient.sharedInstance.homeTimelineWithParams(nil) { (tweets, error) -> () in
            self.tweets = tweets
//            for tweet in tweets! {
//                print("tweet: \(tweet.text), created: \(tweet.createdAt)")
//            }
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tweets != nil {
            return tweets!.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TweetCell", forIndexPath: indexPath) as! TweetCell

        cell.tweet = tweets?[indexPath.row]
        
        return cell
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
