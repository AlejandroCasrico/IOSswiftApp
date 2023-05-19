//
//  ProfileViewController.swift
//  ULSA2023
//
//  Created by Alejandro Casillas on 28/03/23.
//

import UIKit
import NotificationView
class ProfileViewController: UIViewController {
    var nameFromPreviousView: String?
    @IBOutlet weak var peso: UITextField!
    @IBOutlet weak var estature: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var name: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        self.title = "Perfil de \(nameFromPreviousView ?? "no funciono")"
        // Do any additional setup after loading the view.
    }
   
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
    }
    
    @IBAction func save(_ sender: Any) {
        let notificationView =  NotificationView.default
        notificationView.title = "Mensaje"
        notificationView.subtitle = "Datos"
        notificationView.body = "datos guardados de \(name.text ?? "")"
        notificationView.image = UIImage(named: "success")
        notificationView.show()
        self.navigationController?.popViewController(animated: true)
        
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
