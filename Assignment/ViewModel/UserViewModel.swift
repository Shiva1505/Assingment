//
//  File.swift
//  Assignment
//
//  Created by Shiva Kaushik on 06/05/21.
//  Copyright © 2021 Shiva Kaushik. All rights reserved.
//

import Foundation

class UserViewModel {
   weak var vc: ViewController?
    weak var detailVC: DetailsViewController?
    var arrUsers = [UserModel]()
    
    func getData () {
        URLSession.shared.dataTask(with: URL(string: "https://api.github.com/users?since=0&per_page=20")!) { (data, response, error) in
            if error == nil {
                if let data = data {
                    
                    do{
                        let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
                        self.arrUsers.append(contentsOf: userResponse)
                        DispatchQueue.main.async{
                            self.vc?.userTableView.reloadData()
                        }
                        
                        
                    } catch let err{
                        print(err.localizedDescription)
                    }
                }
                
            } else {
                print(error?.localizedDescription)
            }
        } .resume()
    }
}
