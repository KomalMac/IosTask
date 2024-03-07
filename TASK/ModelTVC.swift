//
//  ModelTVC.swift
//  TASK
//
//  Created by Abcom on 07/03/24.
//

import UIKit

class ModelTVC: UITableViewCell {

    @IBOutlet weak var gratitudeLbl: UILabel!
    @IBOutlet weak var journalLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
