//
//  SpotifyViewController.swift
//  ULSA2023
//
//  Created by Alejandro Casillas on 14/02/23.
//

import UIKit
import SwiftVideoBackground
class SpotifyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Spotify Login"
        try? VideoBackground.shared.play(view: view, videoName: "videoSpotifyLogin", videoType: "mp4")
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
