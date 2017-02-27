//
//  TwitterViewController.swift
//  FrenchKit
//
//  Created by Julien on 29/12/2016.
//  Copyright © 2016 Sinplicity. All rights reserved.
//

import TwitterKit

class TwitterViewController: TWTRTimelineViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarItem.accessibilityIdentifier = "Twitter"

        let client = TWTRAPIClient.withCurrentUser()
        self.dataSource = TWTRUserTimelineDataSource(screenName: "FrenchKitConf",
                                                     userID: nil,
                                                     apiClient: client,
                                                     maxTweetsPerRequest: 40,
                                                     includeReplies: false,
                                                     includeRetweets: false)
        self.showTweetActions = false
        
        self.timelineDelegate = self

        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.title = "Twitter".localized
    }
}

extension TwitterViewController : TWTRTimelineDelegate {
    func timelineDidBeginLoading(_ timeline: TWTRTimelineViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func timeline(_ timeline: TWTRTimelineViewController, didFinishLoadingTweets tweets: [Any]?, error: Error?) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
