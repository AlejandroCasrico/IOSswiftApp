//
//  SegundoParcialViewController.swift
//  ULSA2023
//
//  Created by Alejandro Casillas on 28/03/23.
//

import UIKit

class SegundoParcialViewController: UIViewController {

    @IBOutlet weak var user: UILabel!
    
    @IBOutlet weak var userTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Menu"
        user.text = NSLocalizedString("name", comment: "user name")
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "name"){
            let destinationVC = segue.destination as!
                   ProfileViewController
                   let name = userTxt.text
                   destinationVC.nameFromPreviousView = name
        }
       
      
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
