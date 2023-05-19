//
//  IdFaceExamViewController.swift
//  ULSA2023
//
//  Created by Alejandro Casillas on 30/03/23.
//

import UIKit
import LocalAuthentication
class IdFaceExamViewController: UIViewController {
    private let biometricIDAuth = BiometricIDAuth()
    @IBAction func accion2(_ sender: Any) {
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
                let vc = UIStoryboard.init(name: "SegundoParcial", bundle: Bundle.main).instantiateViewController(withIdentifier: "menu") as? SegundoParcialViewController
                    self?.navigationController?.pushViewController(vc!, animated: true)
                print("success")
            }
        }
    }
    override func viewDidLoad() {
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
