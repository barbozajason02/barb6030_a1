//
//  ViewController.swift
//  barb6030_a1
//
//  Created by Jason Barboza on 2020-01-13.
//  Copyright © 2020 wlu. All rights reserved.
//

import UIKit
var like = 0;
var dislike = 0;
var fruitcount = 0;
var currfruit = FruitCollection.collection[FruitCollection.current]
var fruitc = FruitCollection();
/*
let fruitdrag = Fruit(fruitName: "Dragon Fruit", fruitImageName: "dragon-fruit-nutrition-facts.jpg", disLikes: dislike, likes: like);
let fruitapple = Fruit(fruitName: "Apple", fruitImageName: "Pomme-rouge-11.jpg",disLikes: dislike, likes: like);
let fruitmango = Fruit(fruitName: "Mango", fruitImageName: "Unknown.jpeg",disLikes: dislike, likes: like);
let fruitmelon = Fruit(fruitName: "Melon", fruitImageName: "Melon_Lambkin_Hybrid_Christmas.jpg",disLikes: dislike, likes: like);*/

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fruitc = FruitCollection()
        // Do any additional setup after loading the view.
        /*
        FruitCollection(fruit: fruitdrag)
        FruitCollection(fruit: fruitapple)
        FruitCollection(fruit: fruitmango)
        FruitCollection(fruit: fruitmelon)*/
        if let i = UserDefaults.standard.integer(forKey: "currentIndex") as Int?
            {
                print("Fruits existed with index: \(i)")
                FruitCollection.setCurrentIndex(to:i)//restore the fruit
            }
        currfruit = FruitCollection.currentFruit()
        image_View.image = UIImage(named: currfruit.fruitImageName)
    }
    //FruitCollection.init(fruit: fruitcur) should pass in fruit
    @IBOutlet weak var like_label: UILabel!
    @IBOutlet weak var dislike_label: UILabel!
    @IBOutlet weak var image_View: UIImageView!
    
    @IBAction func likeButton(_ sender: UIButton) {
        currfruit.likes = currfruit.likes + 1;
        like_label.text = String(currfruit.likes)
        
    }
    
    @IBAction func dislikeButton(_ sender: UIButton) {
        currfruit.disLikes = currfruit.disLikes + 1;
        dislike_label.text = String(currfruit.disLikes)
    }
    @IBAction func nextImageButton(_ sender: UIButton) {
        if (FruitCollection.current == 3)
        {
            FruitCollection.current = 0;
        }
        else
        {
            FruitCollection.collection[FruitCollection.current] = currfruit
            FruitCollection.current = FruitCollection.current + 1;
        }
        currfruit = FruitCollection.collection[FruitCollection.current]
        like_label.text = String(currfruit.likes)
        dislike_label.text = String(currfruit.disLikes)
        image_View.image = UIImage(named: currfruit.fruitImageName)
    }
}

