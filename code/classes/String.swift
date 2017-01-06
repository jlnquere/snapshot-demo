//
//  String.swift
//  FrenchKit
//
//  Created by Julien on 29/12/2016.
//  Copyright © 2016 Sinplicity. All rights reserved.
//

import Foundation
extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
