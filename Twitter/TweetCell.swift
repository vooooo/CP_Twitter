//
//  TweetCell.swift
//  Twitter
//
//  Created by vu on 9/30/15.
//  Copyright © 2015 CodePath. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screennameLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    
    @IBOutlet weak var replyImageView: UIImageView!
    @IBOutlet weak var retweetImageView: UIImageView!
    @IBOutlet weak var favoriteImageView: UIImageView!
    
    var tweet: Tweet! {
        didSet {
            nameLabel.text = tweet.user!.name
            profileImageView.setImageWithURL(NSURL(string: tweet.user!.profileImageUrl!))
            screennameLabel.text = "@\(tweet.user!.screenname!)"
            tweetLabel.text = tweet.text
            print(tweet.text)
            createdAtLabel.text = timeAgoSinceDate(tweet.createdAt!, numericDates: true)
            
//            tweetLabel.text = "doo doo doo"
            
            
//            profileImageView.setImageWithURL(tweet.user!.profileImageUrl)
            
//            thumbImageView.setImageWithURL(business.imageURL)

//            thumbImageView.setImageWithURL(business.imageURL)
//            distanceLabel.text = business.distance
//            categoriesLabel.text = business.categories
//            addressLabel.text = business.address
//            reviewsCountLabel.text = "\(business.reviewCount!) Reviews"
//            ratingImageView.setImageWithURL(business.ratingImageURL)
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func timeAgoSinceDate(date:NSDate, numericDates:Bool) -> String {
        let calendar = NSCalendar.currentCalendar()
        let now = NSDate()
        let earliest = now.earlierDate(date)
        let latest = (earliest == now) ? date : now
        let components:NSDateComponents = calendar.components([NSCalendarUnit.Minute , NSCalendarUnit.Hour , NSCalendarUnit.Day , NSCalendarUnit.WeekOfYear , NSCalendarUnit.Month , NSCalendarUnit.Year , NSCalendarUnit.Second], fromDate: earliest, toDate: latest, options: NSCalendarOptions())
        
        if (components.year >= 2) {
            return "\(components.year)y"
        } else if (components.year >= 1){
            if (numericDates){
                return "1y"
            } else {
                return "Last year"
            }
        } else if (components.month >= 2) {
            return "\(components.month)m"
        } else if (components.month >= 1){
            if (numericDates){
                return "1m"
            } else {
                return "Last month"
            }
        } else if (components.weekOfYear >= 2) {
            return "\(components.weekOfYear)w"
        } else if (components.weekOfYear >= 1){
            if (numericDates){
                return "1w"
            } else {
                return "Last week"
            }
        } else if (components.day >= 2) {
            return "\(components.day)d"
        } else if (components.day >= 1){
            if (numericDates){
                return "1d"
            } else {
                return "Yesterday"
            }
        } else if (components.hour >= 2) {
            return "\(components.hour)h"
        } else if (components.hour >= 1){
            if (numericDates){
                return "1h"
            } else {
                return "An hour ago"
            }
        } else if (components.minute >= 2) {
            return "\(components.minute)m"
        } else if (components.minute >= 1){
            if (numericDates){
                return "1m"
            } else {
                return "A minute ago"
            }
        } else if (components.second >= 3) {
            return "\(components.second)s"
        } else {
            return "Just now"
        }
        
    }
}
