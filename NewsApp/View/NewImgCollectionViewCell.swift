//
//  NewImgCollectionViewCell.swift
//  NewsApp
//
//  Created by Omar Thamri on 01/09/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class NewImgCollectionViewCell: UICollectionViewCell {
    
    var newsCategory: NewsCategory? {
        didSet {
            if let image = newsCategory?.image {
                newImg.image = UIImage(named: image)
            }
        }
    }
    
    let newImg: UIImageView = {
       let newImg = UIImageView()
        newImg.image = UIImage(named: "tim_cook")
       newImg.contentMode = .scaleToFill
        newImg.translatesAutoresizingMaskIntoConstraints = false
        return newImg
    }()
    var newsDetailViewController: NewsDetailViewController? 
    lazy var backBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "back"), for: .normal)
        btn.tintColor = UIColor.darkGray
        btn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return btn
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
        backgroundColor = UIColor.blue
        addSubview(newImg)
        addSubview(backBtn)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":newImg]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":newImg]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0(25)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":backBtn]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[v0(25)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":backBtn]))
    }
    
    @objc func backAction() {
        newsDetailViewController?.backAction()
    }
    
    
}
