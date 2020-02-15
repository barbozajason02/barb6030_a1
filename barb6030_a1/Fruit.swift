//
//  Fruit.swift
//  barb6030_a1
//
//  Created by Jason Barboza on 2020-01-28.
//  Copyright © 2020 wlu. All rights reserved.
//

import Foundation


/*struct Fruit
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
}*/
import UIKit
import os.log

class Fruit: NSObject, NSCoding {
   let fruitImage : UIImage
   let fruitName : String
   var likes : Int
   var disLikes : Int

   struct PropertyKey {
    static let fruitImage = "fruitImage"
    static let fruitName = "fruitName"
    static let likes = "likes"
    static let disLikes = "disLikes"
    }
   
    func encode(with aCoder: NSCoder) {
    aCoder.encode(fruitName, forKey: PropertyKey.fruitName)
    aCoder.encode(fruitImage, forKey: PropertyKey.fruitImage)
    aCoder.encode(likes, forKey: PropertyKey.likes)
    aCoder.encode(disLikes, forKey: PropertyKey.disLikes)
    }
   
   required convenience init?(coder aDecoder: NSCoder) {
   
           // The name is required. If we cannot decode a name string, the initializer should fail.
       
           guard let nameDecoded = aDecoder.decodeObject(
                   forKey: PropertyKey.fruitName) as? String else {
               os_log("Unable to decode the name for a fruit.",
                      log: OSLog.default, type: .debug)
               return nil
           }
     // Because photo is an optional property of Meal, just use conditional cast.
    let imageDecoded = (aDecoder.decodeObject(forKey: PropertyKey.fruitImage) as? UIImage)!
    let likesDecoded = aDecoder.decodeInteger(forKey: PropertyKey.likes) as Int
    let disLikesDecoded = aDecoder.decodeInteger(forKey: PropertyKey.disLikes) as Int
    // Must call designated initializer.
    self.init(fruitName: nameDecoded, fruitImage: imageDecoded , likes: likesDecoded , disLikes: disLikesDecoded)
    }
    init?(fruitName: String, fruitImage: UIImage, likes: Int, disLikes: Int) {
        self.fruitName = fruitName
        self.fruitImage = fruitImage
        self.likes = likes
        self.disLikes = disLikes
    } //init?
    
    func increaseLikes(){
        self.likes += 1
    }
    
    func increaseDisLikes(){
        self.disLikes += 1
    }
    
    func getLikes() -> String{
        return String(self.likes)
    }
    
    func getDisLikes() -> String{
        return String(self.disLikes)
    }
    
    func getImage() -> UIImage{
        return self.fruitImage
    }
}
