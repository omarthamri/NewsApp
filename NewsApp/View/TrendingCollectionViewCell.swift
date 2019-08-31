//
//  TrendingCollectionViewCell.swift
//  NewsApp
//
//  Created by Omar Thamri on 31/08/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class TrendingCollectionViewCell: UICollectionViewCell {
    
    let trendingImgView: UIImageView = {
       let tiv = UIImageView()
        tiv.image = UIImage(named: "tim_cook")
        tiv.contentMode = .scaleToFill
        tiv.clipsToBounds = true
        tiv.layer.cornerRadius = 5
        tiv.translatesAutoresizingMaskIntoConstraints = false
        return tiv
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
        backgroundColor = UIColor.white
        addSubview(trendingImgView)
    }
    
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[v0]-15-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":trendingImgView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[v0]-5-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":trendingImgView]))
    }
    
    
    
    
}
