//
//  ViewController.swift
//  Assignment
//
//  Created by Shiva Kaushik on 06/05/21.
//  Copyright © 2021 Shiva Kaushik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var viewModelUser = UserViewModel()
    
    @IBOutlet weak var userTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelUser.vc = self
        viewModelUser.getData()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModelUser.arrUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
        cell?.userName.text = "Name : \(viewModelUser.arrUsers[indexPath.row].login!.capitalized)"
         let userdata = viewModelUser.arrUsers[indexPath.row]
        let imageAvtar = userdata.avatar_url
        cell?.userImg.downloaded(from: imageAvtar!)
        cell?.userImg.makeRounded()

        
       
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if let controller = self.storyboard?.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController {
            
            controller.candiId = "Id : \(viewModelUser.arrUsers[indexPath.row].id!)"
            controller.candiName = "Name : \(viewModelUser.arrUsers[indexPath.row].login!.capitalized)"
            let imageAvtar = viewModelUser.arrUsers[indexPath.row].avatar_url
            controller.candiImg = imageAvtar
            
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    
}


