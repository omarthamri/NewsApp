//
//  CategoryView.swift
//  NewsApp
//
//  Created by Omar Thamri on 31/08/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class CategoryView: UIView {
    
    let categoryCellId = "categoryCellId"
    var categoryArray = [Category(name: "Today",selected: true),Category(name: "Business",selected: false),Category(name: "Technology",selected: false),Category(name: "Health",selected: false)]
    
    lazy var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let ccv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        ccv.translatesAutoresizingMaskIntoConstraints = false
        ccv.delegate = self
        ccv.dataSource = self
        return ccv
    }()
    
    let categoryListView: CategoryListView = {
        let clv = CategoryListView()
        clv.translatesAutoresizingMaskIntoConstraints = false
        return clv
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
        addSubview(categoryCollectionView)
        categoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: categoryCellId)
        addSubview(categoryListView)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":categoryCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(30)]-10-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":categoryCollectionView,"v1":categoryListView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":categoryListView]))
    }
    
}

extension CategoryView: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCellId, for: indexPath) as! CategoryCollectionViewCell
        cell.category = categoryArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 4, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            categoryArray = [Category(name: "Today",selected: true),Category(name: "Business",selected: false),Category(name: "Technology",selected: false),Category(name: "Health",selected: false)]
        } else if indexPath.item == 1 {
            categoryArray = [Category(name: "Today",selected: false),Category(name: "Business",selected: true),Category(name: "Technology",selected: false),Category(name: "Health",selected: false)]
        } else if indexPath.item == 2 {
            categoryArray = [Category(name: "Today",selected: false),Category(name: "Business",selected: false),Category(name: "Technology",selected: true),Category(name: "Health",selected: false)]
        } else if indexPath.item == 3 {
            categoryArray = [Category(name: "Today",selected: false),Category(name: "Business",selected: false),Category(name: "Technology",selected: false),Category(name: "Health",selected: true)]
        }
        collectionView.reloadData()
    }
}
