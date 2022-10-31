//
//  Models.swift
//  RayToyBox
//
//  Created by Ray on 31/10/22.
//

import Foundation
import SwiftUI

struct DataModel: Decodable {
    let error : Bool
    let message : String
    let data : [PostModel]
}

struct PostModel: Decodable {
    let id: Int
    let name: String
    let count: Int
}
