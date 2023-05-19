//
//  CiclodeVidaViewController.swift
//  ULSA2023
//
//  Created by Alejandro Casillas on 14/03/23.
//

import UIKit

class CiclodeVidaViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear vista principal")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("view did appear vista principal")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("view will disappear vista principal")
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
