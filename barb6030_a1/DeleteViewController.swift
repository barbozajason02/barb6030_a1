//
//  DeleteViewController.swift
//  barb6030_a1
//
//  Created by Jason Barboza on 2020-02-14.
//  Copyright © 2020 wlu. All rights reserved.
//

import UIKit

class DeleteViewController: UIViewController {

    @IBOutlet weak var image_view: UIImageView!
    @IBOutlet weak var fruit_name: UILabel!
    var sharedFruitCollection : FruitCollection? // this will be the unique FruitCollection we want to work with
    var currfruit: Fruit? = nil
    override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    sharedFruitCollection = SharingFruitCollection.sharedFruitCollection.fruitCollection
    SharingFruitCollection.sharedFruitCollection.loadFruitCollection() // un-archive
        if(SharingFruitCollection.sharedFruitCollection.fruitCollection?.getSize() != 0){
                    currfruit = sharedFruitCollection?.currrentFruit()
                   image_view.image = currfruit?.getImage()
                   fruit_name.text = currfruit?.getName()
               }
               else{
                   image_view.image = UIImage(systemName: "questionmark")
                   fruit_name.text = "No Fruit"
               }
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = SharingFruitCollection()
        SharingFruitCollection.sharedFruitCollection.fruitCollection = FruitCollection()
        SharingFruitCollection.sharedFruitCollection.loadFruitCollection() // un-archive
        if(SharingFruitCollection.sharedFruitCollection.fruitCollection?.getSize() != 0){
            currfruit = sharedFruitCollection?.currrentFruit()
            image_view.image = currfruit?.getImage()
            fruit_name.text = currfruit?.getName()
        }
        else{
            image_view.image = UIImage(systemName: "questionmark")
            fruit_name.text = "No Fruit"
        }
    }
    
    @IBAction func delete_fruit(_ sender: UIButton) {
        if(SharingFruitCollection.sharedFruitCollection.fruitCollection!.getSize() != 0)
         {
            var currentfruit = SharingFruitCollection.sharedFruitCollection.fruitCollection!.currrentFruit()
            _ = SharingFruitCollection.sharedFruitCollection.fruitCollection!.deleteCurrentFruit(currfruit: currentfruit)
            let alert = UIAlertController(title: "Delete a Fruit", message: nil, preferredStyle: .alert)
          alert.message = "The Fruit " + currentfruit.getName() + " is deleted";
          alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
          self.present(alert, animated: true)
            if (SharingFruitCollection.sharedFruitCollection.fruitCollection!.currIndex() > SharingFruitCollection.sharedFruitCollection.fruitCollection!.getSize())
            {
                SharingFruitCollection.sharedFruitCollection.fruitCollection!.resetIndex()
            }
            if(SharingFruitCollection.sharedFruitCollection.fruitCollection!.getSize() != 0)
            {
                currentfruit = SharingFruitCollection.sharedFruitCollection.fruitCollection!.currrentFruit()
                image_view.image = currentfruit.getImage()
                fruit_name.text = currentfruit.getName()
            }
            else
            {
                image_view.image = UIImage(systemName: "questionmark")
                fruit_name.text = "No Fruit"
            }
        }
        else
        {
            image_view.image = UIImage(systemName: "questionmark")
            fruit_name.text = "No Fruit"
            let alert = UIAlertController(title: "No Fruit", message: nil, preferredStyle: .alert)
            alert.message = "The collection is empty";
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    SharingFruitCollection.sharedFruitCollection.saveFruitCollection()
    }
    
    @IBAction func next_image(_ sender: UIButton) {
        SharingFruitCollection.sharedFruitCollection.fruitCollection!.incrementIndex()
        let currIndex = SharingFruitCollection.sharedFruitCollection.fruitCollection!.currIndex()
        
        if(currIndex == SharingFruitCollection.sharedFruitCollection.fruitCollection!.getSize()){
            SharingFruitCollection.sharedFruitCollection.fruitCollection!.resetIndex()
        }
        if(SharingFruitCollection.sharedFruitCollection.fruitCollection!.getSize() != 0)
        {
            currfruit = SharingFruitCollection.sharedFruitCollection.fruitCollection!.currrentFruit()
            
            image_view.image = currfruit?.getImage()
            fruit_name.text = currfruit?.getName()
        }
        else
        {
            let alert = UIAlertController(title: "No Fruit", message: nil, preferredStyle: .alert)
            alert.message = "The collection is empty";
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        SharingFruitCollection.sharedFruitCollection.saveFruitCollection()
    }
    
}
