//
//  FaceIdViewController.swift
//  ULSA2023
//
//  Created by Alejandro Casillas on 16/03/23.
//

import UIKit
import LocalAuthentication
class FaceIdViewController: UIViewController {
    private let biometricIDAuth = BiometricIDAuth()
    @IBAction func faceId(_ sender: Any) {
        
        biometricIDAuth.canEvaluate{(canEvaluate, _,
                                     canEvaluateError) in
            guard canEvaluate else{
                print("no esta configurado el id")
                return
            }
            biometricIDAuth.evaluate{[weak self](success, error) in
                guard success else {
                    print("no configurado")
                    return
                }
                self?.view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
                
                print("success")
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
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
