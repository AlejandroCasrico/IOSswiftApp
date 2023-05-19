//
//  SwipeViewController.swift
//  ULSA2023
//
//  Created by Alejandro Casillas on 09/03/23.
//

import UIKit

class SwipeViewController: UIViewController {

    
    @IBOutlet weak var upperArrow: UIImageView!
    
    @IBOutlet weak var leftArrow: UIImageView!
    

    @IBOutlet weak var rightArrow: UIImageView!
    @IBOutlet weak var buttonArrow: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func Upper(_ sender: Any) {
        print("swipe up")
        upperArrow.isHidden = true
    }
    
    
    @IBAction func left(_ sender: Any) {
        print("swipe left")
        leftArrow.isHidden = true
    }
        
    @IBAction func right(_ sender: Any) {
        print("swipe right")
        rightArrow.isHidden = true
    }

    @IBAction func button(_ sender: Any) {
        print("swipe button")
        buttonArrow.isHidden = true
    }
}
