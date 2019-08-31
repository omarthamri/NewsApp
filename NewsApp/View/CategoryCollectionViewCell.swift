//
//  CategoryCollectionViewCell.swift
//  NewsApp
//
//  Created by Omar Thamri on 31/08/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    var category: Category? {
        didSet {
            if let categoryName = category?.name {
                categoryLbl.text = categoryName
            }
            if let categoryselected = category?.selected {
                if categoryselected == true {
                    categoryLbl.textColor = UIColor.darkGray
                    categoryLbl.font = UIFont.boldSystemFont(ofSize: 13)
                    lineView.backgroundColor = UIColor.blue
                } else {
                    categoryLbl.textColor = UIColor.gray
                    lineView.backgroundColor = UIColor.gray
                    categoryLbl.font = UIFont.systemFont(ofSize: 13)
                }
            }
        }
    }
    
    let categoryLbl: UILabel = {
       let cl = UILabel()
        cl.text = "Today"
        cl.textAlignment = .center
        cl.translatesAutoresizingMaskIntoConstraints = false
        return cl
    }()
    
    let lineView: UIView = {
       let lv = UIView()
        lv.translatesAutoresizingMaskIntoConstraints = false
        return lv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = UIColor.init(white: 0.97, alpha: 1)
        addSubview(categoryLbl)
        addSubview(lineView)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":categoryLbl]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":lineView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(25)]-3-[v1]-1-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":categoryLbl,"v1":lineView]))
    }
}
