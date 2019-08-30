//
//  ChoiceCollectionViewCell.swift
//  NewsApp
//
//  Created by Omar Thamri on 30/08/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class ChoiceCollectionViewCell: UICollectionViewCell {
    
    let choiceImageView: UIImageView = {
       let civ = UIImageView()
        civ.contentMode = .scaleToFill
        civ.clipsToBounds = true
        civ.translatesAutoresizingMaskIntoConstraints = false
        return civ
    }()
    
    let choiceLabel: UILabel = {
       let cl = UILabel()
        cl.text = "All News"
        cl.textAlignment = .center
        cl.font = UIFont.systemFont(ofSize: 13)
        cl.translatesAutoresizingMaskIntoConstraints = false
        return cl
    }()
    
    var choice: Choice? {
        didSet {
            if let choiceName = choice?.choiceName {
                choiceLabel.text = choiceName
            }
            if let chosen = choice?.chosen {
                if chosen == true {
                    choiceImageView.tintColor = UIColor.blue
                    choiceLabel.textColor = UIColor.blue
                } else {
                    choiceImageView.tintColor = UIColor.darkGray
                    choiceLabel.textColor = UIColor.darkGray
                }
            }
            if let choiceImage = choice?.choiceImage {
                choiceImageView.image = UIImage(named: choiceImage)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(choiceImageView)
        addSubview(choiceLabel)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-35-[v0]-35-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":choiceImageView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":choiceLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[v0(30)]-3-[v1(15)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":choiceImageView,"v1":choiceLabel]))
    }
    
    
}
