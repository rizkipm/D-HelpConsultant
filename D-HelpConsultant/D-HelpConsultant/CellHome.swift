//
//  CellHome.swift
//  D-HelpConsultant
//
//  Created by Rizki Syaputra on 11/23/17.
//  Copyright © 2017 Rizki Syaputra. All rights reserved.
//

import UIKit

class CellHome: UITableViewCell {

    @IBOutlet weak var feedtgl: UILabel!
    @IBOutlet weak var feedJudul: UILabel!
    
    @IBOutlet weak var feedby: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
