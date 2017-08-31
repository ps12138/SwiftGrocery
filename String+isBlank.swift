//
//  String+isBlank.swift
//  demo_v1
//
//  Created by PSL on 8/7/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation

extension String {
    var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
            return trimmed.isEmpty
        }
    }
}
