//
//  CustomCell.swift
//  List3
//
//  Created by yuri on 2019/09/22.
//  Copyright © 2019 yuri. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var Photo: UIImageView!
    @IBOutlet weak var Label: UILabel!
    
    
    func cellControllView(number: IndexPath){
        self.Label.text = String((number.row)+1)
        self.Photo.image = UIImage(named: "2.JPG")
    }
    
    //    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//
}
