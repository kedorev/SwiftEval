//
//  AchievementContainer.swift
//  AOS
//
//  Created by stagiaire on 05/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import UIKit

class AchievementContainer {

    static var achievementList:[Achievment] = []
    
    static func reset()
    {
        AchievementContainer.achievementList = []
    }
}
