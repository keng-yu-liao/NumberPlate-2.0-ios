//
//  WaitNumTableViewCell.swift
//  NumberMachine2
//
//  Created by liao on 2021/8/5.
//  Copyright © 2021 liao. All rights reserved.
//

import UIKit

class WaitNumTableViewCell: UITableViewCell {
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var forthLabel: UILabel!
    @IBOutlet weak var fifthLabel: UILabel!
    @IBOutlet weak var testBtn: UIButton!
    
    var onButtonTapped : (() -> Void)!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    @IBAction func actionClick(_ sender: UIButton) {
        self.onButtonTapped()
    }
}
