//
//  ViewController.swift
//  curentine2
//
//  Created by Dhruv Rastogi on 05/09/20.
//  Copyright © 2020 Dhruv Rastogi. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    
    var videoPlayer:AVPlayer?
    var videoPlayerLayer:AVPlayerLayer?
    
    @IBOutlet weak var signUpButton: UIButton!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        setUpElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Set up video in the background
        
        setUpVideo()
    }
    
    func setUpElements()
    {
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
    }
    
    func setUpVideo(){
        
        // Get the path to the resource in the bundle
        let bundlePath = Bundle.main.path(forResource: "CURENTINE", ofType: "mp4")
        
        guard bundlePath != nil else {
            return
        }
        
        // Create a Url from it
        
        let url = URL(fileURLWithPath: bundlePath!)
        
        //Create the video player Item
        let item = AVPlayerItem(url: url)
        
        // Create the player
        
        videoPlayer = AVPlayer(playerItem: item)
        
        // Create the layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        
        // Adjust the size and frame
        videoPlayerLayer?.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height )
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        // Add it to the view and play it
        videoPlayer?.playImmediately(atRate: 0.3)
    }


}

