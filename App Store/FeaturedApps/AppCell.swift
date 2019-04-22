//
//  AppCell.swift
//  App Store
//
//  Created by Matheus Mariano on 14/11/18.
//  Copyright © 2018 Matheus Mariano. All rights reserved.
//

import UIKit

class AppCell: UICollectionViewCell {
    
    static let iconSize = 100
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "BankingAppIcon")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "One Safe: files and passwords"
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Productivity"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.darkGray
        
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$3.99"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.darkGray
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(iconImageView)
        iconImageView.frame = CGRect(x: 0, y: 0, width: AppCell.iconSize, height: AppCell.iconSize)
        
        addSubview(titleLabel)
        titleLabel.frame = CGRect(x: 0, y: iconImageView.frame.maxY + 2, width: frame.width, height: 40)
        
        addSubview(categoryLabel)
        categoryLabel.frame = CGRect(x: 0, y: titleLabel.frame.maxY, width: frame.width, height: 20)
        
        addSubview(priceLabel)
        priceLabel.frame = CGRect(x: 0, y: categoryLabel.frame.maxY, width: frame.width, height: 20)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
