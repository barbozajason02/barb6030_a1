//
//  ViewController.swift
//  barb6030_a1
//
//  Created by Jason Barboza on 2020-01-13.
//  Copyright © 2020 wlu. All rights reserved.
//

import UIKit
var d_like_count = 0;
var d_dislike_count = 0;
var a_like_count = 0;
var a_dislike_count = 0;
var m_like_count = 0;
var m_dislike_count = 0;
var mel_like_count = 0;
var mel_dislike_count = 0;
var loop = 1;


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var like_label: UILabel!
    @IBOutlet weak var dislike_label: UILabel!
    @IBOutlet weak var image_View: UIImageView!
    
    @IBAction func likeButton(_ sender: UIButton) {
        if loop == 1
        {
            d_like_count += 1
            like_label.text = String(d_like_count)
        }
        if loop == 2
        {
            a_like_count += 1
            like_label.text = String(a_like_count)
        }
        if loop == 3
        {
            m_like_count += 1
            like_label.text = String(m_like_count)
        }
        if loop == 4
        {
            mel_like_count += 1
            like_label.text = String(mel_like_count)
        }
    }
    
    @IBAction func dislikeButton(_ sender: UIButton) {
        if loop == 1
        {
            d_dislike_count += 1
            dislike_label.text = String(d_dislike_count)
        }
        if loop == 2
        {
            a_dislike_count += 1
            dislike_label.text = String(a_dislike_count)
        }
        if loop == 3
        {
            m_dislike_count += 1
            dislike_label.text = String(m_dislike_count)
        }
        if loop == 4
        {
            mel_dislike_count += 1
            dislike_label.text = String(mel_dislike_count)
        }
    }
    @IBAction func nextImageButton(_ sender: UIButton) {
        loop += 1
        if loop == 1
        {
            image_View.image = UIImage(named:"dragon-fruit-nutrition-facts.jpg")
            like_label.text = String(d_like_count)
            dislike_label.text = String(d_dislike_count)
        }
        if loop == 2
        {
            image_View.image = UIImage(named:"Pomme-rouge-11.jpg")
            like_label.text = String(a_like_count)
            dislike_label.text = String(a_dislike_count)
        }
        if loop == 3
        {
            image_View.image = UIImage(named:"Unknown.jpeg")
            like_label.text = String(m_like_count)
            dislike_label.text = String(m_dislike_count)
            
        }
        if loop == 4
        {
            image_View.image = UIImage(named:"Melon_Lambkin_Hybrid_Christmas.jpg")
            like_label.text = String(mel_like_count)
            dislike_label.text = String(mel_dislike_count)
            loop = 0;
        }
    }
}

