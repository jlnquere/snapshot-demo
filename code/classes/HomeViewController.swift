//
//  HomeViewController.swift
//  FrenchKit
//
//  Created by Julien on 28/12/2016.
//  Copyright © 2016 Sinplicity. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.text = "EventName".localized
        self.contentTextView.text = "EventPitch".localized
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.title = "EventName".localized
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarItem.accessibilityIdentifier = "Home"
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        contentTextView.setContentOffset(CGPoint.zero, animated: false)
    }
}
