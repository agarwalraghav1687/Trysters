//
//  ProfileViewController.swift
//  curentine2
//
//  Created by Raghav Agarwal on 27/09/20.
//  Copyright © 2020 Dhruv Rastogi. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()

    }
    
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var DOB: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var City: UITextField!
    @IBOutlet weak var State: UITextField!
    @IBOutlet weak var Pincode: UITextField!
    @IBOutlet weak var Logout: UIButton!
    func setUpElements()
    {
        
        Utilities.styleTextField(Name)
        Utilities.styleTextField(DOB)
        Utilities.styleTextField(Email)
        Utilities.styleTextField(City)
        Utilities.styleTextField(State)
        Utilities.styleTextField(Pincode)
        Utilities.styleFilledButton(Logout)
    }

}
