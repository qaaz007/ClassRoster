//
//  PersonDetailViewController.swift
//  Class Roster
//
//  Created by Adnan Aziz on 4/11/15.
//  Copyright (c) 2015 Adnan Aziz. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var person : Person!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    // image button outlets
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = person.fullName()
        self.firstNameTextField.text = person.firstName
        self.lastNameTextField.text = person.lastName
        
        if (person.image != nil) {
            self.imageView.image = person.image
            self.addImageButton.hidden = true
        }

    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        person.firstName = self.firstNameTextField.text
        person.lastName = self.lastNameTextField.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addImage(sender: AnyObject) {
        let picker = UIImagePickerController()
        if (UIImagePickerController.isSourceTypeAvailable(.Camera)) {
            picker.sourceType = .Camera
        }
        else {
            picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        
        picker.delegate = self
        picker.allowsEditing = true 
        self.presentViewController(picker, animated: true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        self.imageView.image = image
        self.person.image = image
        self.addImageButton.hidden = true
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
