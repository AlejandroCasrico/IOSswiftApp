//
//  ViewDetailViewController.swift
//  ULSA2023
//
//  Created by Alejandro Casillas on 16/03/23.
//

import UIKit

class ViewDetailViewController: UIViewController {
  
        var nameFromPreviousView: String?
    var directionFromPreviousView: String?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = directionFromPreviousView
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
