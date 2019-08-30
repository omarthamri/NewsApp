//
//  Choice.swift
//  NewsApp
//
//  Created by Omar Thamri on 30/08/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class Choice: NSObject {
    
    var choiceName: String?
    var chosen: Bool?
    var choiceImage: String?
    
     init(choiceName: String?,chosen: Bool?,choiceImage: String?) {
        self.choiceName = choiceName
        self.chosen = chosen
        self.choiceImage = choiceImage
    }
    
}
