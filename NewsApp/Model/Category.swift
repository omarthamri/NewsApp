//
//  Category.swift
//  NewsApp
//
//  Created by Omar Thamri on 31/08/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class Category: NSObject {
    
    var name: String?
    var selected: Bool?
    
    init(name: String?,selected: Bool?) {
        self.name = name
        self.selected = selected
    }
    
    
}
