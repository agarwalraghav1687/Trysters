//
//  picUpload.swift
//  curentine2
//
//  Created by Dhruv Rastogi on 21/09/20.
//  Copyright © 2020 Dhruv Rastogi. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase
import FirebaseStorage


class picUpload: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
            super.viewDidLoad()
            setUpElements()
        guard let urlString = UserDefaults.standard.value(forKey: "url") as? String,
            let url = URL(string: urlString) else {
                return
                   
        }

        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.profileImage.image = image
            }
        })
        
        task.resume()
    }
    
    //Elements
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var dobField: UITextField!

    @IBOutlet weak var buyer: UIButton!
    
    @IBOutlet weak var Seller: UIButton!
    
    @IBAction func didTapButton(_ sender: Any)
    {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    func setUpElements()
    {
        // Style the elements
        Utilities.styleTextField(dobField)
        Utilities.styleFilledButton(buyer)
        Utilities.styleFilledButton(Seller)

    }
    
    private let storage = Storage.storage().reference()
    
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        
        guard let imageData = image.pngData() else {
            return
        }
        

        let userID = Auth.auth().currentUser?.uid
        storage.child("images/\(userID!).png").putData(imageData, metadata: nil, completion: { _, error in
            guard error == nil else{
                print("Failed to upload")
                return
                
            }
            
            self.storage.child("images/\(userID!).png").downloadURL(completion: { url, error in
                guard let url = url, error == nil else {
                    return
                }
                
                let urlString = url.absoluteString
                DispatchQueue.main.async {
                    self.profileImage.image = image
                }
                print("Download Url: \(urlString)")
                UserDefaults.standard.set(urlString, forKey: "url")
            })
        })
        
        //Upload image data
        //get dowmload URL
        //save downloads urls to user dafaults
        
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    //Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise, it returns the error message
    func validateFields() -> String? {
       
        // Check that all fields are filled in
        if dobField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            
            return "Please fill in all fields."
        }
        
        return nil
    }

    
}
