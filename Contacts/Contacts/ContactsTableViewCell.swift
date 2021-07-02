//
//  ContactsTableViewCell.swift
//  Contacts
//
//  Created by Илья on 02.07.2021.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phonenumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(contact: ContactsCellData) {
        nameLabel.text = contact.name
        phonenumberLabel.text = contact.phonenumber
    }
    /*override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    */
}
