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
        URLSession.shared.dataTask(with: URL(string: "https://api.github.com/users?since=\(vc!.pageString)")!) { (data, response, error) in
            print("https://api.github.com/users?since=\(self.vc!.pageString)")
            if error == nil {
                if let data = data {
                    
                    do{
                        
                        let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
                        self.arrUsers.append(contentsOf: userResponse)
                        DispatchQueue.main.async{
                            self.vc?.userTableView.reloadData()
                        }
                        self.vc!.pageString += 1
                        
                    } catch let err{
                        self.vc!.end = true;
                        print(err.localizedDescription)
                    }
                }
                
            } else {
                print(error?.localizedDescription)
            }
        } .resume()
    }
    
}
