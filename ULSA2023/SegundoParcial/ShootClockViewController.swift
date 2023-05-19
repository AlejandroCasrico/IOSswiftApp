//
//  ShootClockViewController.swift
//  ULSA2023
//
//  Created by Alejandro Casillas on 28/02/23.
//

import UIKit
import SwiftySound
class ShootClockViewController: UIViewController {

    @IBOutlet weak var lblcCounter: UILabel!
    @IBOutlet weak var lblDot: UILabel!
    @IBOutlet weak var btnstart: UIButton!
    var countdownTimer: Timer!
    var totalTime = 24
    private var mySound: Sound?
    
    func startTimer() {
        countdownTimer =
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
    }
    @objc func updateTime(){
        lblcCounter.text = "\(totalTime)"
        if lblDot.isHidden == true{
            btnstart.setTitle("Stop", for: UIControl.State.normal)
        }else{
            btnstart.setTitle("Start", for: UIControl.State.normal)
            lblDot.isHidden = false
        }
        if totalTime != 0{
            lblDot.isHidden = true
            totalTime -= 1
        }else{
            endTimer()
            print("se acabo el reloj")
            
        }
    }
    
    func endTimer(){
        lblDot.isHidden = false
        countdownTimer.invalidate()
        Sound.enabled = true
        if let URL = Bundle.main.url(forResource: "endgame", withExtension: "mp3"){
            mySound = Sound(url: URL)
        }
        mySound?.play {completed in
            print("completed:\(completed)")
            self.navigationController?
                .popToRootViewController(animated: true)
        }
    }
    
    @IBAction func resetAction(_ sender: Any) {
        lblcCounter.text = "24"
        totalTime = 24
    }
    
    @IBAction func startAction(_ sender: Any) {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        if countdownTimer == nil{
            startTimer()
        }else{
            if btnstart.titleLabel?.text == "Stop"{
                countdownTimer.invalidate()
                btnstart.setTitle("Start", for: UIControl.State.normal)
                lblDot.isHidden = false
            }else{
                countdownTimer.invalidate()
                startTimer()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Shoot Clock"
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
