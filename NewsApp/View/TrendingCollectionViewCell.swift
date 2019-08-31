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
    
    let writerImgView: UIImageView = {
        let wiv = UIImageView()
        wiv.image = UIImage(named: "pencil")
        wiv.contentMode = .scaleToFill
        wiv.clipsToBounds = true
        wiv.layer.cornerRadius = 5
        wiv.translatesAutoresizingMaskIntoConstraints = false
        wiv.tintColor = UIColor.gray
        return wiv
    }()
    
    let trendingTypeView: UIView = {
       let ttv = UIView()
        ttv.backgroundColor = UIColor.orange
        ttv.translatesAutoresizingMaskIntoConstraints = false
        ttv.layer.cornerRadius = 2
        ttv.clipsToBounds = true
        return ttv
    }()
    
    let trendingTypeLbl: UILabel = {
       let tl = UILabel()
        tl.text = "Technology"
        tl.textColor = UIColor.white
        tl.font = UIFont.boldSystemFont(ofSize: 8)
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.textAlignment = .center
        return tl
    }()
    
    let writerLbl: UILabel = {
        let wl = UILabel()
        wl.text = "Omar Thamri"
        wl.textColor = UIColor.gray
        wl.font = UIFont.boldSystemFont(ofSize: 8)
        wl.translatesAutoresizingMaskIntoConstraints = false
        wl.textAlignment = .left
        return wl
    }()
    
    let trendingTitleLbl: UILabel = {
       let ttl = UILabel()
       ttl.text = "Apple invites press to September 10th event, confirming iPhone 11 launch date"
       ttl.numberOfLines = 0
       ttl.textAlignment = .left
       ttl.lineBreakMode = .byWordWrapping
        ttl.textColor = UIColor.white
        ttl.translatesAutoresizingMaskIntoConstraints = false
        ttl.font = UIFont.systemFont(ofSize: 15)
       return ttl
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
        addSubview(trendingImgView)
        addSubview(trendingTypeView)
        trendingTypeView.addSubview(trendingTypeLbl)
        addSubview(trendingTitleLbl)
        addSubview(writerImgView)
        addSubview(writerLbl)
    }
    
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[v0]-15-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":trendingImgView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[v0]-5-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":trendingImgView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-35-[v0(54)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":trendingTypeView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-100-[v0(20)]-10-[v1(40)]-10-[v2(10)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":trendingTypeView,"v1":trendingTitleLbl,"v2":writerImgView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-180-[v0(10)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":writerLbl]))
        trendingTypeView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":trendingTypeLbl]))
        trendingTypeView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":trendingTypeLbl]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-35-[v0]-35-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":trendingTitleLbl]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-35-[v0(10)]-10-[v1(100)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":writerImgView,"v1":writerLbl]))
        
    }
    
    
    
    
}
