//
//  RestaurantTableViewCell.swift
//  ULSA2023
//
//  Created by Alejandro Casillas on 02/05/23.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var imageN: UIImageView!
    @IBOutlet weak var calificacion: UILabel!
    @IBOutlet weak var titulo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var data : restaurantModel?{
        didSet {
            calificacion.text = "\(data?.rating)"
            titulo.text = data?.name
            imageN.image = UIImage(named: data?.imgName ?? "")
         
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
