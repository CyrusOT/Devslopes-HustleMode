//
//  ViewController.swift
//  Hustle-mode
//
//  Created by Ahmed AlOtaibi on 7/22/19.
//  Copyright © 2019 Ahmed AlOtaibi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //Outlets
    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var hustleModeLbl: UILabel!
    @IBOutlet weak var onLabl: UILabel!
    
    // Variables
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")! // Create a path for local wav file
        let url = URL(fileURLWithPath: path)                                  // Save the path as URL
        do {
            player = try AVAudioPlayer(contentsOf: url) // Loaded the wav file into the player
            player.prepareToPlay()                      // Prepare the player to play the wav file
        } catch let error as NSError {                  // Catch errors (if any!)
            print(error.description)                    // Print the description of the error (if any!)
        }
    
    }

    @IBAction func powerBtnPressed(_ sender: UIButton) {
        cloudHolder.isHidden = false //Show the cloudHolder
        darkBlueBG.isHidden = true  //Hide the darkBlueBG
        powerBtn.isHidden = true   //Hide the powerBtn
        
        player.play() //play the sound
        
        //animate the rocket movement
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 20, width: 415, height: 708)
        }) { (finished) in
            self.hustleModeLbl.isHidden = false //Show the hustleModeLbl
            self.onLabl.isHidden = false        //Show the onLabl
            
        }
    }
    

}

