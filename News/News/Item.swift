//
//  Item.swift
//  News
//
//  Created by Meenakshi Pathani on 06/10/25.
//

import Foundation
import SwiftData

@Model
final class Item : Identifiable{
    var id:UUID
    var timestamp: Date
    
    init(id: UUID = UUID(), timestamp: Date) {
        self.id = id
        self.timestamp = timestamp
    }
    
   
}
