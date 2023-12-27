//
//  Joke.swift
//  random jokes
//
//  Created by Mahendra Khibrah on 20/12/23.
//

import Foundation
import ObjectMapper

class JokeDto : Mappable {
    func mapping(map: Map) {
        id <- map["id"]
        type <- map["type"]
        setup <- map["setup"]
        punchline <- map["punchline"]
    }
    
    var id : Int?
    var type : String?
    var setup : String?
    var punchline : String?
    
    required init?(map: Map) {
    }
}
