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
    var sharedFruitCollection : FruitCollection? // this will be the unique FruitCollection we want to work with
    override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    sharedFruitCollection = SharingFruitCollection.sharedFruitCollection.fruitCollection // if we forget thisline, the fruit collection is not the same collection of the sharing fruit collection!
    SharingFruitCollection.sharedFruitCollection.loadFruitCollection() // un-archive
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = SharingFruitCollection()
        SharingFruitCollection.sharedFruitCollection.fruitCollection = FruitCollection()
        SharingFruitCollection.sharedFruitCollection.loadFruitCollection() // un-archive
        
        image_view.image = currfruit?.getImage()
    }
    
    @IBAction func delete_fruit(_ sender: UIButton) {
        let currentfruit = SharingFruitCollection.sharedFruitCollection.fruitCollection!.currrentFruit()
        let deletefruit = SharingFruitCollection.sharedFruitCollection.fruitCollection!.deleteCurrentFruit(currfruit: currentfruit)
    SharingFruitCollection.sharedFruitCollection.saveFruitCollection()
        print(deletefruit.fruitName)
    }
    
    @IBAction func next_image(_ sender: UIButton) {
        SharingFruitCollection.sharedFruitCollection.fruitCollection!.incrementIndex()
        let currIndex = SharingFruitCollection.sharedFruitCollection.fruitCollection!.currIndex()
        
        if(currIndex == SharingFruitCollection.sharedFruitCollection.fruitCollection!.getSize()){
            SharingFruitCollection.sharedFruitCollection.fruitCollection!.resetIndex()
        }
        
        currfruit = SharingFruitCollection.sharedFruitCollection.fruitCollection!.currrentFruit()
        
        image_view.image = currfruit?.getImage()
    }
}
