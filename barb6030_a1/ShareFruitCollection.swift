//
//  ShareFruitCollection.swift .swift
//  barb6030_a1
//
//  Created by Jason Barboza on 2020-02-13.
//  Copyright © 2020 wlu. All rights reserved.
//

import Foundation

class SharingFruitCollection: NSObject, NSCoding {
    
    
    let collectionKey = "collectionKey"
    let currentKey = "currentKey"
    
    required convenience init?(coder decoder: NSCoder) {
     self.init()
        SharingFruitCollection.sharedFruitCollection.fruitCollection?.collection = (decoder.decodeObject(forKey: collectionKey) as? [Fruit])!
     current = (decoder.decodeInteger(forKey: currentKey))
    }
    
    func encode(with acoder: NSCoder) {
        acoder.encode( SharingFruitCollection.sharedFruitCollection.fruitCollection?.collection , forKey: collectionKey)
          acoder.encode(current, forKey: currentKey)
    }
    
    
    
    static let sharedFruitCollection = SharingFruitCollection()
    let fileName = "A3fruits.archive"
    private let rootKey = "rootKey"
    var fruitCollection : FruitCollection?
    
    func dataFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(
            FileManager.SearchPathDirectory.documentDirectory,
            FileManager.SearchPathDomainMask.userDomainMask, true)
        let documentsDirectory = paths[0] as NSString
        return documentsDirectory.appendingPathComponent(fileName) as String
    }
    func loadFruitCollection(){
        print("loadFruitCollection  ...starting")
        let filePath = self.dataFilePath()
        if (FileManager.default.fileExists(atPath: filePath)) {
        let data = NSMutableData(contentsOfFile: filePath)!
            if (filePath != "")
            {
                let unarchiver = NSKeyedUnarchiver(forReadingWith: data as Data)
                SharingFruitCollection.sharedFruitCollection.fruitCollection =
                unarchiver.decodeObject(forKey: rootKey) as? FruitCollection
                unarchiver.finishDecoding()
            }
        }
    }
        func saveFruitCollection(){
            let filePath = self.dataFilePath()
            print("saving the data")
            let data = NSMutableData()
            let archiver = NSKeyedArchiver(forWritingWith: data)
            archiver.encode(SharingFruitCollection.sharedFruitCollection.fruitCollection,forKey: rootKey)
            archiver.finishEncoding()
            data.write(toFile: filePath, atomically: true)
    }
 } //Class
