//
//  FruitCollection.swift
//  barb6030_a1
//
//  Created by Jason Barboza on 2020-01-28.
//  Copyright © 2020 wlu. All rights reserved.
//

import Foundation

struct FruitCollection
{
    static var collection = [Fruit]()//collection is an array of fruits
    static var current:Int = 0 //the current fruit in the collection (to be shown in the scene)
    init(fruit: Fruit)
    {//init is automatically called when you make an instance of the FruitCollection
        /*
        let fruitdrag = Fruit(fruitName: "Dragon Fruit", fruitImageName: "dragon-fruit-nutrition-facts.jpg");
        let fruitapple = Fruit(fruitName: "Apple", fruitImageName: "Pomme-rouge-11.jpg");
        let fruitmango = Fruit(fruitName: "Mango", fruitImageName: "Unknown.jpeg");
        let fruitmelon = Fruit(fruitName: "Melon", fruitImageName: "Melon_Lambkin_Hybrid_Christmas.jpg");
        FruitCollection.collection.append(fruitdrag)
        FruitCollection.collection.append(fruitapple)
        FruitCollection.collection.append(fruitmango)
        FruitCollection.collection.append(fruitmelon)*/
        FruitCollection.collection.append(fruit)
    }//init
    
    //return the current fruit
    static func currentFruit() -> Fruit
    {
        let fruit = FruitCollection.collection[FruitCollection.current]
        return fruit
        
    }
    
    //return the index of the current fruit
    static func setCurrentIndex(to index: Int)
    {
        //you may need this function for relaunching the app
        FruitCollection.current = index
    }
    
    //return the index of the current fruit in the collection
    static func getCurrentIndex() -> Int
    {
        return FruitCollection.current
    }
    
    //other helper functions you may need when relaunching the app
}