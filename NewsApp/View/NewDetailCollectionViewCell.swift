//
//  NewDetailCollectionViewCell.swift
//  NewsApp
//
//  Created by Omar Thamri on 02/09/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class NewDetailCollectionViewCell: UICollectionViewCell {
    
    
    var newsCategory: NewsCategory? {
        didSet {
            if let title = newsCategory?.title {
                titleLbl.text = title
            }
            if let type = newsCategory?.type {
            typeLbl.text = type
            }
            if let author = newsCategory?.author {
                writerLbl.text = author
            }
            if let time = newsCategory?.time {
                timeLbl.text = time
            }
            if let detail = newsCategory?.detail {
                detailLbl.text = detail
            }
        }
    }
    
    let typeView: UIView = {
        let ttv = UIView()
        ttv.backgroundColor = UIColor.orange
        ttv.translatesAutoresizingMaskIntoConstraints = false
        ttv.layer.cornerRadius = 2
        ttv.clipsToBounds = true
        return ttv
    }()
    
    let typeLbl: UILabel = {
        let tl = UILabel()
        tl.textColor = UIColor.white
        tl.font = UIFont.boldSystemFont(ofSize: 8)
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.textAlignment = .center
        return tl
    }()
    
    let timeImgView: UIImageView = {
        let tiv = UIImageView()
        tiv.image = UIImage(named: "time")
        tiv.contentMode = .scaleToFill
        tiv.tintColor = UIColor.gray
        tiv.clipsToBounds = true
        tiv.layer.cornerRadius = 5
        tiv.translatesAutoresizingMaskIntoConstraints = false
        return tiv
    }()
    
    let timeLbl: UILabel = {
        let tl = UILabel()
        tl.textColor = UIColor.gray
        tl.font = UIFont.systemFont(ofSize: 12)
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.textAlignment = .left
        return tl
    }()
    
    let titleLbl: UILabel = {
        let ttl = UILabel()
        ttl.numberOfLines = 0
        ttl.textAlignment = .left
        ttl.lineBreakMode = .byWordWrapping
        ttl.textColor = UIColor.darkGray
        ttl.translatesAutoresizingMaskIntoConstraints = false
        ttl.font = UIFont.boldSystemFont(ofSize: 15)
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
        wl.textColor = UIColor.gray
        wl.font = UIFont.boldSystemFont(ofSize: 8)
        wl.translatesAutoresizingMaskIntoConstraints = false
        wl.textAlignment = .left
        return wl
    }()
    
    let lineView: UIView = {
        let ttv = UIView()
        ttv.backgroundColor = UIColor.gray
        ttv.translatesAutoresizingMaskIntoConstraints = false
        return ttv
    }()
    
    let detailLbl: UILabel = {
        let ttl = UILabel()
        ttl.numberOfLines = 0
        ttl.textAlignment = .left
        ttl.lineBreakMode = .byWordWrapping
        ttl.textColor = UIColor.darkGray
        ttl.translatesAutoresizingMaskIntoConstraints = false
        ttl.font = UIFont.systemFont(ofSize: 13)
        ttl.sizeToFit()
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
        backgroundColor = UIColor.white
        addSubview(typeView)
        typeView.addSubview(typeLbl)
        addSubview(timeImgView)
        addSubview(timeLbl)
        addSubview(titleLbl)
        addSubview(writerImgView)
        addSubview(writerLbl)
        addSubview(lineView)
        addSubview(detailLbl)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0(54)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":typeView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[v0(20)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":typeView]))
        typeView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":typeLbl]))
        typeView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":typeLbl]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-28-[v0(12)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":timeImgView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(12)]-5-[v1(40)]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":timeImgView,"v1":timeLbl]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-28-[v0(12)]-10-[v1(40)]-10-[v2(10)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":timeLbl,"v1":titleLbl,"v2":writerImgView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":titleLbl]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0(10)]-10-[v1(90)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":writerImgView,"v1":writerLbl]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-95-[v0(20)]-10-[v1(1)]-0.1-[v2]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":writerLbl,"v1":lineView,"v2":detailLbl]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":lineView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":detailLbl]))
    }
    
    
}
