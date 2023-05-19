//
//  DetailssViewController.swift
//  ULSA2023
//
//  Created by Alejandro Casillas on 25/04/23.
//

import UIKit

class DetailssViewController: UIViewController {

    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var rango: UILabel!
    
    
    @IBOutlet weak var habilidad: UILabel!
    
    
    @IBOutlet weak var imagPers: UIImageView!
    
    @IBOutlet weak var estado: UILabel!
    var detailData: demonSlayerCharacters?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pilar de nombre:\( detailData?.name ?? "")"
        imagPers.image = UIImage(named: detailData?.image ?? "")
        name.text  = detailData?.name
        rango.text = detailData?.range
        habilidad.text = detailData?.ability
        if detailData?.status ?? true {
            estado.text = "Vivo"
        }else{
            estado.text = "dead"
        }

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
