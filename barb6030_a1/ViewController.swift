//
//  fruitview.swift
//  barb6030_a3
//
//  Created by Jason Barboza on 2020-01-13.
//  Copyright © 2020 wlu. All rights reserved.
//

import UIKit
var like = 0;
var dislike = 0;
var fruitcount = 0;
var current = SharingFruitCollection.sharedFruitCollection.fruitCollection!.current
var currfruit =  SharingFruitCollection.sharedFruitCollection.fruitCollection?.collection[current]

class ViewController: UIViewController {

    var sharedFruitCollection : FruitCollection? // this will be the unique FruitCollection we want to work with
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sharedFruitCollection =
        SharingFruitCollection.sharedFruitCollection.fruitCollection // if we forget thisline, the fruit collection is not the same collection of the sharing fruit collection!
        //SharingFruitCollection.sharedFruitCollection.loadFruitCollection() // un-archive
        }
       override func viewDidLoad() {
        super.viewDidLoad()
        _ = SharingFruitCollection()
        SharingFruitCollection.sharedFruitCollection.fruitCollection = FruitCollection()
        //SharingFruitCollection.sharedFruitCollection.loadFruitCollection() // un-archive
    }
    //FruitCollection.init(fruit: fruitcur) should pass in fruit
    @IBOutlet weak var like_label: UILabel!
    @IBOutlet weak var dislike_label: UILabel!
    @IBOutlet weak var image_View: UIImageView!
    
    @IBAction func likeButton(_ sender: UIButton) {
        current = SharingFruitCollection.sharedFruitCollection.fruitCollection!.current
        currfruit = (SharingFruitCollection.sharedFruitCollection.fruitCollection?.collection[current])! //fruitc.collection[current];
        currfruit!.likes = currfruit!.likes + 1
        like_label.text = String(currfruit!.likes)
        
    }
    
    @IBAction func dislikeButton(_ sender: UIButton) {
        current = SharingFruitCollection.sharedFruitCollection.fruitCollection!.current
        currfruit = (SharingFruitCollection.sharedFruitCollection.fruitCollection?.collection[current])!
        currfruit!.disLikes = currfruit!.disLikes + 1;
        dislike_label.text = String(currfruit!.disLikes)
    }
    @IBAction func nextImageButton(_ sender: UIButton) {
        current = SharingFruitCollection.sharedFruitCollection.fruitCollection!.current
        currfruit = (SharingFruitCollection.sharedFruitCollection.fruitCollection?.collection[current])!
        if (current == ((SharingFruitCollection.sharedFruitCollection.fruitCollection?.collection)!.count) - 1)
        {
            (SharingFruitCollection.sharedFruitCollection.fruitCollection!.current) = 0;
        }
        else
        {
            (SharingFruitCollection.sharedFruitCollection.fruitCollection!.current) = (SharingFruitCollection.sharedFruitCollection.fruitCollection!.current) + 1;
        }
        current = SharingFruitCollection.sharedFruitCollection.fruitCollection!.current
        currfruit = (SharingFruitCollection.sharedFruitCollection.fruitCollection?.collection[current])!
        like_label.text = String(currfruit!.likes)
        dislike_label.text = String(currfruit!.disLikes)
        image_View.image = currfruit?.fruitImage
    }
}

