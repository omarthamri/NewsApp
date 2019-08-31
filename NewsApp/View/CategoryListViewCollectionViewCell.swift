//
//  CategoryListViewCollectionViewCell.swift
//  NewsApp
//
//  Created by Omar Thamri on 31/08/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class CategoryListViewCollectionViewCell: UICollectionViewCell {
    
    
    var newCategory: NewsCategory? {
        didSet {
            if let title = newCategory?.title {
                categoryTitleLbl.text = title
            }
            if let image = newCategory?.image {
                categoryNewImgView.image = UIImage(named: image)
            }
            if let type = newCategory?.type {
                categoryTypeLbl.text = type
            }
        }
    }
    
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
        cniv.contentMode = .scaleToFill
        cniv.layer.cornerRadius = 5
        cniv.clipsToBounds = true
        cniv.translatesAutoresizingMaskIntoConstraints = false
        return cniv
    }()
    
    let categoryTypeView: UIView = {
        let ttv = UIView()
        ttv.backgroundColor = UIColor.orange
        ttv.translatesAutoresizingMaskIntoConstraints = false
        ttv.layer.cornerRadius = 2
        ttv.clipsToBounds = true
        return ttv
    }()
    let categoryTypeLbl: UILabel = {
        let tl = UILabel()
        tl.textColor = UIColor.white
        tl.font = UIFont.boldSystemFont(ofSize: 7)
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.textAlignment = .center
        return tl
    }()
    
    let categoryTitleLbl: UILabel = {
        let ttl = UILabel()
        ttl.numberOfLines = 0
        ttl.textAlignment = .left
        ttl.lineBreakMode = .byWordWrapping
        ttl.textColor = UIColor.darkGray
        ttl.translatesAutoresizingMaskIntoConstraints = false
        ttl.font = UIFont.systemFont(ofSize: 11)
        return ttl
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
    
    let writerLbl: UILabel = {
        let wl = UILabel()
        wl.text = "Omar Thamri"
        wl.textColor = UIColor.gray
        wl.font = UIFont.boldSystemFont(ofSize: 8)
        wl.translatesAutoresizingMaskIntoConstraints = false
        wl.textAlignment = .left
        return wl
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
        addSubview(categoryTypeView)
        categoryTypeView.addSubview(categoryTypeLbl)
        addSubview(categoryTitleLbl)
        addSubview(writerImgView)
        addSubview(writerLbl)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[v0]-5-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":categoryListBackgroundImgView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-1-[v0]-1-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":categoryListBackgroundImgView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0(110)]-10-[v1(44)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":categoryNewImgView,"v1":categoryTypeView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-14-[v0]-11-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":categoryNewImgView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-25-[v0(15)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":categoryTypeView]))
        categoryTypeView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":categoryTypeLbl]))
        categoryTypeView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":categoryTypeLbl]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-40-[v0(40)]-5-[v1(10)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":categoryTitleLbl,"v1":writerImgView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-136-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":categoryTitleLbl]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-136-[v0(10)]-10-[v1(100)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":writerImgView,"v1":writerLbl]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-85-[v0(10)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":writerLbl]))
    }
    
    
}
