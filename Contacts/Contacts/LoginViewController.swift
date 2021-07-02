//
//  LoginViewController.swift
//  Contacts
//
//  Created by Илья on 02.07.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var contactsText: UILabel!
    @IBOutlet weak var loginText: UILabel!
    @IBOutlet weak var passwordText: UILabel!

    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBAction func loginButtonAction(_ sender: Any) {
        let loginTry = loginField.text
        let passwordTry = passwordField.text
        if loginTry == "admin" && passwordTry == "admin" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let secondViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            navigationController?.pushViewController(secondViewController, animated: true)
            
        }
    }
        
        /*
         {
            present(storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
        }
        */
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
