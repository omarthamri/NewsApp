//
//  CategoryListViewCollectionViewCell.swift
//  NewsApp
//
//  Created by Omar Thamri on 31/08/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class CategoryListViewCollectionViewCell: UICollectionViewCell {
    
    
    let categoryListBackgroundImgView: UIImageView = {
       let clbv = UIImageView()
        clbv.image = UIImage(named: "btn")
        clbv.contentMode = .scaleToFill
        clbv.layer.cornerRadius = 5
        clbv.clipsToBounds = true
        clbv.translatesAutoresizingMaskIntoConstraints = false
        return clbv
    }()
    
    let categoryNewImgView: UIImageView = {
        let cniv = UIImageView()
        cniv.image = UIImage(named: "apple_card")
        cniv.contentMode = .scaleToFill
        cniv.layer.cornerRadius = 5
        cniv.clipsToBounds = true
        cniv.translatesAutoresizingMaskIntoConstraints = false
        return cniv
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
        tl.text = "Finance"
        tl.textColor = UIColor.white
        tl.font = UIFont.boldSystemFont(ofSize: 7)
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.textAlignment = .center
        return tl
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
        addSubview(categoryListBackgroundImgView)
        addSubview(categoryNewImgView)
        addSubview(trendingTypeView)
        trendingTypeView.addSubview(trendingTypeLbl)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[v0]-5-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":categoryListBackgroundImgView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-1-[v0]-1-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":categoryListBackgroundImgView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0(110)]-10-[v1(44)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":categoryNewImgView,"v1":trendingTypeView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-14-[v0]-11-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":categoryNewImgView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-25-[v0(15)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":trendingTypeView]))
        trendingTypeView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":trendingTypeLbl]))
        trendingTypeView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":trendingTypeLbl]))
    }
    
    
}
