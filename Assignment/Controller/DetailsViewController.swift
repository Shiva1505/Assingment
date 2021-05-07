//
//  DetailsViewController.swift
//  Assignment
//
//  Created by Shiva Kaushik on 06/05/21.
//  Copyright © 2021 Shiva Kaushik. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var userName: UILabel!
    
    
    var candiImg: String!
    var candiId: String!
    var candiName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "User Details"
        userId.text = candiId
        userName.text = candiName
        userImg.downloaded(from: candiImg)
        userImg.makeRounded()
        
        
        
        
    }
    

}
