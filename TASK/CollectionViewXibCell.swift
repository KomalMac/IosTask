//
//  CollectionViewXibCell.swift
//  TASK
//
//  Created by Komal  on 06/03/24.
//

import UIKit

class CollectionViewXibCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Set corner radius
        layer.cornerRadius = 14
        layer.masksToBounds = true
        
    }

}
