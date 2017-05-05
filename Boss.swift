//
//  Boss.swift
//  AOS
//
//  Created by stagiaire on 05/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

class Boss
{
    let id:Int
    let name:String
    let description:String
    
    
    init(idData: Int, nameData: String, descriptionData: String? )
    {
        self.id = idData
        self.name = nameData
        self.description = descriptionData ?? ""
    }
}
