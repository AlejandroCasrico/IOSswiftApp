//
//  LottieViewController.swift
//  ULSA2023
//
//  Created by Alejandro Casillas on 09/03/23.
//

import UIKit
import Lottie

class LottieViewController: UIViewController {
    @IBOutlet weak var ViewLottie: LottieAnimationView!
    
    override func viewDidLoad() {
        ViewLottie.contentMode = .scaleAspectFit
        ViewLottie.loopMode = .loop
        ViewLottie.animationSpeed = 0.5
        ViewLottie.play()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
