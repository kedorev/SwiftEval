//
//  Achievment.swift
//  AOS
//
//  Created by stagiaire on 05/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//


class Achievment {

    static let tag:String = "achievement"
    var game:String = "wow"
    var id:Int32 = 1
    var title:String = "n/a"
    var point:Int32 = 0
    var description:String = "n/a"
    
    
    init(json: [String: Any], gameData: String )
    {
        print(json)
        self.game = gameData
        self.id = (json["id"] as? Int32)!
        self.title = (json["title"] as? String)!
        self.point = (json["points"] as? Int32)!
        self.description = (json["description"] as? String)!
    }
    
    
}
