//
//  Fruit.swift
//  barb6030_a1
//
//  Created by Jason Barboza on 2020-01-28.
//  Copyright © 2020 wlu. All rights reserved.
//

import Foundation

struct Fruit
{
    let fruitImageName:String
    let fruitname:String
    var likes = 0
    var disLikes = 0
    
    init(fruitName: String, fruitImageName: String, disLikes: Int, likes: Int)
    {
        self.fruitImageName = fruitImageName
        self.fruitname = fruitName
        self.disLikes = likes;
        self.likes = disLikes;
        
    }
}
