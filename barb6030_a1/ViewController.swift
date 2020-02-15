//
//  fruitview.swift
//  barb6030_a3
//
//  Created by Jason Barboza on 2020-01-13.
//  Copyright © 2020 wlu. All rights reserved.
//

import UIKit
var current = SharingFruitCollection.sharedFruitCollection.fruitCollection!.current
var currfruit =  SharingFruitCollection.sharedFruitCollection.fruitCollection?.collection[current]

class ViewController: UIViewController {
    
    @IBOutlet weak var image_View: UIImageView!
    @IBOutlet weak var dislike_lb: UILabel!
    @IBOutlet weak var like_lb: UILabel!
    
    var sharedFruitCollection : FruitCollection? // this will be the unique FruitCollection we want to work with
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sharedFruitCollection =
        SharingFruitCollection.sharedFruitCollection.fruitCollection // if we forget thisline, the fruit collection is not the same collection of the sharing fruit collection!
        SharingFruitCollection.sharedFruitCollection.loadFruitCollection() // un-archive
            }
       override func viewDidLoad() {
        super.viewDidLoad()
        _ = SharingFruitCollection()
        SharingFruitCollection.sharedFruitCollection.fruitCollection = FruitCollection()
        SharingFruitCollection.sharedFruitCollection.loadFruitCollection() // un-archive
        
        image_View.image = currfruit?.getImage()
        like_lb.text = currfruit?.getLikes()
        dislike_lb.text = currfruit?.getDisLikes()
    }
    
    @IBAction func nextImageButton(_ sender: UIButton) {
        
        SharingFruitCollection.sharedFruitCollection.fruitCollection!.incrementIndex()
        let currIndex = SharingFruitCollection.sharedFruitCollection.fruitCollection!.currIndex()
        
        if(currIndex == SharingFruitCollection.sharedFruitCollection.fruitCollection!.getSize()){
            SharingFruitCollection.sharedFruitCollection.fruitCollection!.resetIndex()
        }
        
        currfruit = SharingFruitCollection.sharedFruitCollection.fruitCollection!.currrentFruit()
        
        image_View.image = currfruit?.getImage()
        like_lb.text = currfruit?.getLikes()
        dislike_lb.text = currfruit?.getDisLikes()
    }
    
    @IBAction func thumbsUp(_ sender: Any) {
        currfruit!.increaseLikes()
        like_lb.text = currfruit?.getLikes()
        //like_label.text = currfruit?.getLikes()
    }
    @IBAction func thumbsDown(_ sender: Any) {
        currfruit!.increaseDisLikes()
        dislike_lb.text = currfruit?.getDisLikes()
        //dislike_label.text = currfruit!.getDisLikes()
    }
}

