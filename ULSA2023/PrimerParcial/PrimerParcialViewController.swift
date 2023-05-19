//
//  PrimerParcialViewController.swift
//  ULSA2023
//
//  Created by Alejandro Casillas on 23/02/23.
//

import UIKit

class PrimerParcialViewController: UIViewController {

    @IBOutlet weak var txtAltura: UITextField!
    @IBOutlet weak var txtPeso: UITextField!
    @IBOutlet weak var txtResult: UILabel!
    
    @IBAction func Calculate(_ sender: UIButton) {
        var peso = Double(txtPeso.text
                                 ?? "0.0") ?? 0.0
        var altura = Double(txtAltura.text
                                 ?? "0.0") ?? 0.0
       
        txtResult.text = estatusPciente(peso: peso, altura:altura)
    }
  
    func estatusPciente (peso:Double,altura:Double) ->String{
        var IMC = peso/(altura*altura)
        print(IMC)
        var estatusDelPaciente = ""
        if(IMC >= 19 && IMC<=24.9){
            estatusDelPaciente = "EL paciente se encuentra en el Peso adecuado"
            print("El peso del paciente es: \(estatusDelPaciente)")
            //txtResult.text = estatusDelPaciente
        }else{
            estatusDelPaciente = "El paciente NO se encuentra en el peso adecuado"
            print("El paciente se encuentra en : \(estatusDelPaciente)")
           // txtResult.text = estatusDelPaciente
        }
        return estatusDelPaciente
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
