//
//  PostViewController.swift
//  curentine2
//
//  Created by Raghav Agarwal on 27/09/20.
//  Copyright © 2020 Dhruv Rastogi. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet weak var post: UIButton!
    @IBOutlet weak var image: UIButton!
    @IBOutlet weak var Email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
    }
    func setUpElements()
    {
        
        // Style the elements
        Utilities.styleTextField(Email)
        Utilities.styleFilledButton(post)
        Utilities.styleFilledButton(image)
    }

    
}
