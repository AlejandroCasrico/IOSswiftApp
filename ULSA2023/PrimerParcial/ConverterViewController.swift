//
//  ViewController.swift
//  ULSA2023
//
//  Created by Alejandro Casillas on 07/02/23.
//

import UIKit

class ConverterViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var txtGrados: UITextField!
    @IBOutlet weak var label2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Converter"
    }
    @IBAction func change(_ sender: UIButton) {
        let celcuis = Double(label2.text
                                  ?? "0.0") ?? 0.0
        if convertCeltoFar(celcuis:celcuis ) <= 50 {
            imageView.image = UIImage(named: "snow")
        } else {
            imageView.image = UIImage(named: "heat")
        }
        txtGrados.text = """
         El resultado de convertir \(celcuis) es \(convertCeltoFar(celcuis:celcuis)) farengheit
        """
    }
    
    func convertCeltoFar(celcuis: Double) -> Double {
        let convertResult = ((celcuis*9)/5)+32
        return convertResult
    }
    
}

