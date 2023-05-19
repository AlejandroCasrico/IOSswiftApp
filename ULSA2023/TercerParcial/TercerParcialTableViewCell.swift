//
//  TercerParcialTableViewCell.swift
//  ULSA2023
//
//  Created by Alejandro Casillas on 16/05/23.
//

import UIKit

class TercerParcialTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imgName: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var capital: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var data : statesModel?{
        didSet {
            capital.text = data?.capital
            name.text = data?.name
            imgName.image = UIImage(named: data?.imgName ?? "")
         
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
