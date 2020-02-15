//
//  fruitview.swift
//  barb6030_a3
//
//  Created by Jason Barboza on 2020-01-13.
//  Copyright © 2020 wlu. All rights reserved.
//

import UIKit
var current = 0
var currfruit: Fruit? = nil

class ViewController: UIViewController {
    
    @IBOutlet weak var image_View: UIImageView!
    @IBOutlet weak var dislike_lb: UILabel!
    @IBOutlet weak var like_lb: UILabel!
    @IBOutlet weak var fruit_name: UILabel!
    
    var sharedFruitCollection : FruitCollection? // this will be the unique FruitCollection we want to work with
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sharedFruitCollection =
        SharingFruitCollection.sharedFruitCollection.fruitCollection // if we forget thisline, the fruit collection is not the same collection of the sharing
        SharingFruitCollection.sharedFruitCollection.loadFruitCollection() // un-archive
        if(SharingFruitCollection.sharedFruitCollection.fruitCollection?.getSize() != 0){
            currfruit = sharedFruitCollection?.currrentFruit()
            image_View.image = currfruit?.getImage()
            fruit_name.text = currfruit?.getName()
            dislike_lb.text = currfruit?.getLikes()
            like_lb.text = currfruit?.getLikes()
        }
        else{
            image_View.image = UIImage(systemName: "questionmark")
            fruit_name.text = "No Fruit"
            dislike_lb.text = String(0)
            like_lb.text = String(0)
        }
    }
       override func viewDidLoad() {
        super.viewDidLoad()
        _ = SharingFruitCollection()
        SharingFruitCollection.sharedFruitCollection.fruitCollection = FruitCollection()
        SharingFruitCollection.sharedFruitCollection.loadFruitCollection() // un-archive
        if(SharingFruitCollection.sharedFruitCollection.fruitCollection?.getSize() != 0){
            currfruit = sharedFruitCollection?.currrentFruit()
            image_View.image = currfruit?.getImage()
            fruit_name.text = currfruit?.getName()
            dislike_lb.text = currfruit?.getLikes()
            like_lb.text = currfruit?.getLikes()
        }
        else{
            image_View.image = UIImage(systemName: "questionmark")
            fruit_name.text = "No Fruit"
            dislike_lb.text = String(0)
            like_lb.text = String(0)
        }
    }
    
    @IBAction func nextImageButton(_ sender: UIButton) {
        
        SharingFruitCollection.sharedFruitCollection.fruitCollection!.incrementIndex()
        let currIndex = SharingFruitCollection.sharedFruitCollection.fruitCollection!.currIndex()
        
        if(currIndex == SharingFruitCollection.sharedFruitCollection.fruitCollection!.getSize()){
            SharingFruitCollection.sharedFruitCollection.fruitCollection!.resetIndex()
        }
        if(SharingFruitCollection.sharedFruitCollection.fruitCollection?.getSize() != 0){
            currfruit = SharingFruitCollection.sharedFruitCollection.fruitCollection!.currrentFruit()
            
            image_View.image = currfruit?.getImage()
            like_lb.text = currfruit?.getLikes()
            dislike_lb.text = currfruit?.getDisLikes()
            fruit_name.text = currfruit?.getName()
        }
        else
        {
            let alert = UIAlertController(title: "No Fruit", message: nil, preferredStyle: .alert)
            alert.message = "The collection is empty";
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func thumbsUp(_ sender: Any) {
         if(SharingFruitCollection.sharedFruitCollection.fruitCollection?.getSize() != 0){
            currfruit!.increaseLikes()
            like_lb.text = currfruit?.getLikes()
        }
        else
         {
            let alert = UIAlertController(title: "No Fruit", message: nil, preferredStyle: .alert)
            alert.message = "The collection is empty";
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    @IBAction func thumbsDown(_ sender: Any) {
         if(SharingFruitCollection.sharedFruitCollection.fruitCollection?.getSize() != 0){
            currfruit!.increaseDisLikes()
            dislike_lb.text = currfruit?.getDisLikes()
        }
        else
         {
            let alert = UIAlertController(title: "No Fruit", message: nil, preferredStyle: .alert)
            alert.message = "The collection is empty";
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
}

