//
//  doerCell.swift
//  doer
//
//  Created by 沈荻凯 on 2019/7/14.
//  Copyright © 2019 Shen DiKai. All rights reserved.
//

import UIKit

class doerCell: UITableViewCell {

    @IBOutlet weak var checkMark: UILabel!
    @IBOutlet weak var doer: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
