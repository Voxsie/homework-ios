//
//  DetailViewController.swift
//  Contacts
//
//  Created by Илья on 02.07.2021.
//

import UIKit

protocol DetailViewControllerDelegate: AnyObject   {
    func saveNewDataOfComment(_ contact: ContactsCellData  )
}

class DetailViewController: UIViewController {

    @IBOutlet weak var contactLogo: UIImageView!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberText: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var workPlaceText: UILabel!
    @IBOutlet weak var workPlaceLabel: UILabel!
    @IBOutlet weak var commentTextView: UITextView!
    
    var contact: ContactsCellData?
    weak var delegate: DetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        surnameLabel.text = contact?.surname
        nameLabel.text = contact?.name
        phoneNumberLabel.text = contact?.phonenumber
        workPlaceLabel.text = contact?.workplace
        commentTextView.text = contact?.comment
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        contact?.comment = commentTextView.text
        if let contact = contact {
            delegate?.saveNewDataOfComment(contact)
    }
    }
}
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

