//
//  AppDelegate.swift
//  FrenchKit
//
//  Created by Julien on 28/12/2016.
//  Copyright © 2016 Sinplicity. All rights reserved.
//

import UIKit
import Fabric
import TwitterKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        Fabric.with([Twitter.self])
        return true
    }
}
