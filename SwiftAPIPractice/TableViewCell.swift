//
//  TableViewCell.swift
//  SwiftAPIPractice
//
//  Created by KentoFujita on 2023/04/04.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func bindData(text: String) {
        label.text = text
    }
    
}
