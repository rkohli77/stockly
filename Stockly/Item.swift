//
//  Item.swift
//  Stockly
//
//  Created by Ritu Kohli on 2024-08-25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
