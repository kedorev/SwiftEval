//
//  ApiConnexion.swift
//  AOS
//
//  Created by stagiaire on 05/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import Alamofire
import UIKit
import Foundation

class ApiConnexion
{
    let defaults = UserDefaults.standard
    var area:String
    static var jsonData:[String: Any] = [:]
    private let apiKey:String = "bt45v25cykrna6hkmzysdadxeynxjnm4"
    
    private let url:String = "https://eu.api.battle.net"
    static var shares = ApiConnexion()
    
    private init()
    {
        let areaStorage:String? = defaults.value( forKey: "areaStorage" ) as? String
        if( areaStorage != nil)
        {
            self.area = areaStorage!
        }
        else
        {
            self.area = "eu"
        }
    }
    
    func request(game:String, target:String, id: Int?, tableViewControler: UITableView)
    {
        //https://eu.api.battle.net/wow/boss/?locale=fr_FR&apikey=bt45v25cykrna6hkmzysdadxeynxjnm4
        //https://eu.api.battle.net/WOW/boss/?locale=fr_FR&apikey=bt45v25cykrna6hkmzysdadxeynxjnm4




        var request:String = "https://\(self.area).api.battle.net/\(game)/\(target)/"
        if let variableName = id
        {
            request = request + ( variableName as! String )
        }
        request = request + "?locale=fr_FR&apikey=bt45v25cykrna6hkmzysdadxeynxjnm4"
        //print(request)
        Alamofire.request(request).responseJSON
        { response in
            //print(response.result)
            if(response.result.isSuccess)
            {
                
                if let JSON = response.result.value as? [String: Any]
                {
                
                    //ApiConnexion.jsonData = JSON as! [String : Any]
                    if(target == "achievement")
                    {
                        AchievementContainer.achievementList.append(Achievment(json: JSON as! [String : Any], gameData: game))
                    }
                    else if(target == "boss")
                    {
                        BossContainer.bossList = []
                        let bosses = JSON["bosses"]
                        for boss in (bosses as?  [[String: Any]])!
                        {
                            BossContainer.bossList.append(Boss(idData: boss["id"] as! Int, nameData: boss["name"] as! String, descriptionData: boss["description"] as? String ))
                        }
                        BossContainer.bossList = BossContainer.bossList.sorted { $0.name < $1.name }                      
                    }
                    tableViewControler.reloadData()
                }
            }
            
        }
        
    }
    
    
    
}
