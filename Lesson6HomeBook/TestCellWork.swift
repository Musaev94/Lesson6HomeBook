//
//  TestCellWork.swift
//  Lesson6HomeBook
//
//  Created by user on 28/1/22.
//

import Foundation
import UIKit

// это кастомная ячейка которая наслед от UICollectionViewCell
class TestCellWork: UICollectionViewCell {
    
    lazy var titleView: UIImageView = {
        let view = UIImageView()
        
        return view
    }()
    
    lazy var titlePrice: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        
        return view
    }()
    
    override func layoutSubviews() {
        addSubview(titleView)
        titleView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
        }
        
        addSubview(titlePrice)
        titlePrice.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(10);            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        
    
    }
}
