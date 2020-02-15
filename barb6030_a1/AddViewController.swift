//
//  AddViewController.swift
//  barb6030_a1
//
//  Created by Jason Barboza on 2020-02-14.
//  Copyright © 2020 wlu. All rights reserved.
//

import UIKit

class AddViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate {
    
    let imagePicker = UIImagePickerController()
    @IBOutlet weak var image_view: UIImageView!
    @IBOutlet weak var field_name: UITextField!
    var image_set = 0;
    var sharedFruitCollection : FruitCollection? // this will be the unique FruitCollection we want to work with
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sharedFruitCollection =
        SharingFruitCollection.sharedFruitCollection.fruitCollection // if we forget thisline, the fruit collection is not the same collection of the sharing fruit collection!
        SharingFruitCollection.sharedFruitCollection.loadFruitCollection() // un-archive
            }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
             let tap = UITapGestureRecognizer(target: self, action: #selector(AddViewController.tappedMe))
             image_view.addGestureRecognizer(tap)
            image_view.isUserInteractionEnabled = true
            imagePicker.delegate = self
        
         }
    @objc func tappedMe()
         {
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
                 
            present(imagePicker, animated: true, completion: nil)
         }
    
    @IBAction func if_returned(_ sender: Any) {
        field_name.resignFirstResponder()
    }

    @IBAction func add_fruit(_ sender: UIButton) {
        if (field_name.text != "" && image_set == 1)
        { SharingFruitCollection.sharedFruitCollection.fruitCollection!.addCurrentFruit(imageName: String(field_name.text!), fruitImage: image_view.image!)
            let alert = UIAlertController(title: "Add a Fruit", message: nil, preferredStyle: .alert)
            alert.message = "The fruit " + field_name.text! + " is added";

            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            image_view.image = UIImage(systemName: "questionmark")
            field_name.text = ""
            SharingFruitCollection.sharedFruitCollection.saveFruitCollection()
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image_view.contentMode = .scaleAspectFit
            image_view.image = pickedImage
            image_set = 1;
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
