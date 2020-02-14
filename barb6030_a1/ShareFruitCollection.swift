//
//  ShareFruitCollection.swift .swift
//  barb6030_a1
//
//  Created by Jason Barboza on 2020-02-13.
//  Copyright © 2020 wlu. All rights reserved.
//

import Foundation

class SharingFruitCollection {
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
            do{
                let unarchiver = try NSKeyedUnarchiver(forReadingFrom: data as Data)
                SharingFruitCollection.sharedFruitCollection.fruitCollection = unarchiver.decodeObject(forKey: rootKey) as? FruitCollection
                unarchiver.finishDecoding()
            }
            catch
            {
                print("didnt work bud")
            }
        }
    }
        func saveFruitCollection(){
            let filePath = self.dataFilePath()
            print("saving the data")
            let data = NSMutableData()
            //let archiver = NSKeyedArchiver(forWritingWith: data)
            let archiver = NSKeyedArchiver(requiringSecureCoding:true)
    archiver.encode(SharingFruitCollection.sharedFruitCollection.fruitCollection,
    forKey: rootKey)
            archiver.finishEncoding()
            data.write(toFile: filePath, atomically: true)
    }
 } //Class
