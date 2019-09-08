//
//  NewsCategory.swift
//  NewsApp
//
//  Created by Omar Thamri on 31/08/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class NewsCategory: NSObject {
    
    var image: String?
    var title: String?
    var type: String?
    var author: String?
    var time: String?
    var detail: String?
    
    init(image: String?,title: String?,type: String?,author: String?,time: String?,detail: String?) {
        self.image = image
        self.title = title
        self.type = type
        self.author = author
        self.time = time
        self.detail = detail
    }
}
