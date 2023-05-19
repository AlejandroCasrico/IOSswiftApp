//
//  CharactersTableViewCell.swift
//  ULSA2023
//
//  Created by Alejandro Casillas on 18/04/23.
//

import UIKit

class CharactersTableViewCell: UITableViewCell {

    @IBOutlet weak var imgpilaragua: UIImageView!
    
    @IBOutlet weak var range: UILabel!
    
    @IBOutlet weak var namelbl: UILabel!
    
    
    @IBOutlet weak var lblability: UILabel!
    
    @IBOutlet weak var statuslbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var data : demonSlayerCharacters?{
        didSet {
            range.text = data?.range
            lblability.text = data?.ability
            namelbl.text = data?.name
            imgpilaragua.image = UIImage(named: data?.image ?? "aguapilar")
            imgpilaragua.layer.cornerRadius = imgpilaragua.bounds.size.width / 2.0
            if data?.status ?? true {
                statuslbl.text = "Vivo"
            }else{
                statuslbl.text = "dead"
            }
            
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
