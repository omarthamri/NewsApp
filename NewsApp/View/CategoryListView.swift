//
//  CategoryListView.swift
//  NewsApp
//
//  Created by Omar Thamri on 31/08/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class CategoryListView: UIView {
    
    lazy var categoryListViewCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
       let clvcv = UICollectionView(frame: .zero, collectionViewLayout: layout)
       clvcv.translatesAutoresizingMaskIntoConstraints = false
        clvcv.delegate = self
        clvcv.dataSource = self
        clvcv.backgroundColor = UIColor.init(white: 0.97, alpha: 1)
        return clvcv
    }()
    var homeViewController: HomeViewController?
    let categoryListViewCollectionViewCellId = "categoryListViewCollectionViewCellId"
    let newsCategoryArray = [NewsCategory(image: "apple_card",title: "The biggest differences between Apple's new credit card and most other cards",type: "Finance"),NewsCategory(image: "secure",title: "This tech could secure voting machines, but not before 2020",type: "Finance"),NewsCategory(image: "tim_cook",title: "Apple invites press to September 10th event, confirming iPhone 11 launch date",type: "Technology")]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = UIColor.red
        addSubview(categoryListViewCollectionView)
        categoryListViewCollectionView.register(CategoryListViewCollectionViewCell.self, forCellWithReuseIdentifier: categoryListViewCollectionViewCellId)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":categoryListViewCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":categoryListViewCollectionView]))
    }
    
}

extension CategoryListView: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsCategoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryListViewCollectionViewCellId, for: indexPath) as! CategoryListViewCollectionViewCell
        cell.newCategory = newsCategoryArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        homeViewController?.newsCategory = newsCategoryArray[indexPath.item]
        homeViewController?.displayDetailNew()
    }
    
    
    
}
