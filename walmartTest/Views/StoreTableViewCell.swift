//
//  StoreTableViewCell.swift
//  walmartTest
//
//  Created by Pedro Iván Romero Ojeda on 6/15/20.
//  Copyright © 2020 piro. All rights reserved.
//

import UIKit

class StoreTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ store: Store) {
        name.text = store.name
        address.text = store.address
    }

}
