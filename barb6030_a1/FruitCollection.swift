//
//  FruitCollection.swift
//  barb6030_a1
//
//  Created by Jason Barboza on 2020-01-28.
//  Copyright © 2020 wlu. All rights reserved.
//

import Foundation
import Foundation
import UIKit

class FruitCollection: NSObject, NSCoding {
   var collection = [Fruit]() // a collection is an array of fruits
   var current:Int = 0 // the current fruit in the collection shown in scene
   
    let collectionKey = "collectionKey"
    let currentKey = "currentKey"
   
    // MARK: - NSCoding methods
       override init(){
           super.init()
           setup()
       }
   
       required convenience init?(coder decoder: NSCoder) {
        self.init()
        collection = (decoder.decodeObject(forKey: collectionKey) as? [Fruit])!
        current = (decoder.decodeInteger(forKey: currentKey))
       }
   
       func encode(with acoder: NSCoder) {
           acoder.encode(collection, forKey: collectionKey)
             acoder.encode(current, forKey: currentKey)
       }
    
    func setup()
    {
        self.collection.append(Fruit(fruitName: "Dragon Fruit", fruitImage: UIImage(named: "dragon-fruit-nutrition-facts.jpg")!, likes: 0, disLikes: 0)!)
        self.collection.append(Fruit(fruitName: "Apple", fruitImage: UIImage(named: "Pomme-rouge-11.jpg")!, likes: 0, disLikes: 0)!)
        self.collection.append(Fruit(fruitName: "Mango", fruitImage: UIImage(named: "Unknown.jpeg")!, likes: 0, disLikes: 0)!)
        self.collection.append(Fruit(fruitName: "Melon", fruitImage: UIImage(named: "Melon_Lambkin_Hybrid_Christmas.jpg")!, likes: 0, disLikes: 0)!)
    }
    
    func getFruit() -> Fruit{
        return collection[current]
    }
       
    func incrementIndex(){
        current += 1
    }
    
    func decrementIndex(){
        current -= 1 
    }
    
    func currIndex() -> Int{
        return current
    }
    
    func resetIndex(){
        current = 0
    }
    
    func getSize() -> Int{
        return collection.count
    }
    
    func currrentFruit() -> Fruit{
        return collection[current]
    }
    
    func deleteCurrentFruit(currfruit: Fruit)->Fruit
    {
        let fruit = currfruit;
        for item in collection {
            if (item.getName() == currfruit.getName())
            {
                collection.remove(at: current)
            }
            self.current = 0;
        }
        return fruit
    }
    func addCurrentFruit(imageName: String,fruitImage: UIImage)
       {
        self.collection.append(Fruit(fruitName: imageName, fruitImage: fruitImage, likes: 0, disLikes: 0)!)
       }
}
     // Mark: - Helpers
    

