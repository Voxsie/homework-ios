//
//  ViewController.swift
//  Contacts
//
//  Created by Илья on 02.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [ContactsCellData] =
        [ContactsCellData(name: "Ilya", surname: "Zheltikov", workplace: "ITIS", phonenumber: "+7(927)941-13-33", comment: "Author"),
         ContactsCellData(name: "Anton", surname: "Terentev", workplace: "Not working", phonenumber: "+7(995)500-40-50", comment: "Call tonight"),
         ContactsCellData(name: "Sergey", surname: "Lupandin", workplace: "Hookah Place", phonenumber: "+7(997)777-77-77", comment: "Busy"),
         ContactsCellData(name: "Emil", surname: "Khalfin", workplace: "Shashlikoff", phonenumber: "+7(971)777-77-00", comment: "Busy"),
         ContactsCellData(name: "Alexey", surname: "Gorbunov", workplace: "GameClub", phonenumber: "+7(927)927-27-27", comment: "Busy"),
         ContactsCellData(name: "Tagir", surname: "Kabirov", workplace: "iOS Place", phonenumber: "+7(987)870-78-78", comment: "Busy"),
         ContactsCellData(name: "Danil", surname: "Gaimaltdinov", workplace: "Cheat Developer", phonenumber: "+7(937)367-77-77", comment: "Busy"),
         ContactsCellData(name: "Voxsie", surname: "Nevados", workplace: "GameDev", phonenumber: "+7(923)123-12-13", comment: "Busy"),
         ContactsCellData(name: "Egor", surname: "Zhiltsov", workplace: "Battle.net", phonenumber: "+7(929)222-23-11", comment: "Busy"),
         ContactsCellData(name: "Ser", surname: "Gamer", workplace: "Not working", phonenumber: "+7(828)233-11-11", comment: "Busy")]
         
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let contactViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        
        contactViewController.delegate = self
        contactViewController.contact = data[indexPath.row]
        
        present(contactViewController, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let contact = tableView.dequeueReusableCell(withIdentifier: "ContactsTableViewCell") as? ContactsTableViewCell else { return UITableViewCell() }
        contact.setData(contact: data[indexPath.row])
        return contact
        }
    }

    
extension ViewController: DetailViewControllerDelegate {
    func saveNewDataOfComment(_ contact: ContactsCellData) {
        if let index = data.firstIndex (where: { $0.surname == contact.surname && $0.name == contact.name }) {
            data[index] = contact
        }
    }
}

struct ContactsCellData {
    let name: String
    let surname: String
    let workplace: String
    let phonenumber: String
    var comment: String
}

