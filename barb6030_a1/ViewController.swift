//
//  ViewController.swift
//  barb6030_a1
//
//  Created by Jason Barboza on 2020-01-13.
//  Copyright © 2020 wlu. All rights reserved.
//

import UIKit
var like_count = 0;
var dislike_count = 0;


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var like_label: UILabel!
    @IBOutlet weak var dislike_label: UILabel!
    
    @IBAction func likeButton(_ sender: UIButton) {
        like_count += 1
        print("Like Button")
        print(like_count)
        like_label.text = String(like_count)
    }
    
    @IBAction func dislikeButton(_ sender: UIButton) {
        dislike_count += 1
        print("Dislike Button")
        print(dislike_count)
        dislike_label.text = String(dislike_count)
    }
    @IBAction func nextImageButton(_ sender: UIButton) {
        
    }
}

