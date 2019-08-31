//
//  TrendingView.swift
//  NewsApp
//
//  Created by Omar Thamri on 31/08/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class TrendingView: UIView {
    
    let trendingLbl: UILabel = {
       let tl = UILabel()
       tl.text = "Trending Topics"
       tl.textColor = UIColor.darkGray
       tl.font = UIFont.boldSystemFont(ofSize: 15)
       tl.textAlignment = .left
       tl.translatesAutoresizingMaskIntoConstraints = false
       return tl
    }()
    
    lazy var trendingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let tcv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        tcv.translatesAutoresizingMaskIntoConstraints = false
        tcv.dataSource = self
        tcv.delegate = self
        tcv.isPagingEnabled = true
       return tcv
    }()
    let pagecontrol : UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()
    let trendingCellId = "trendingCellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(trendingLbl)
        addSubview(trendingCollectionView)
        trendingCollectionView.register(TrendingCollectionViewCell.self, forCellWithReuseIdentifier: trendingCellId)
        addSubview(pagecontrol)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[v0]-15-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":trendingLbl]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":trendingCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-15-[v0(20)]-15-[v1]-15-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":trendingLbl,"v1":trendingCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":pagecontrol]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":pagecontrol]))
    }
    
    
}


extension TrendingView: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: trendingCellId, for: indexPath) as! TrendingCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        pagecontrol.currentPage = Int(targetContentOffset.pointee.x / frame.width)
    }
    
}
