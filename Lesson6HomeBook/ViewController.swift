//
//  ViewController.swift
//  Lesson6HomeBook
//
//  Created by user on 28/1/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout { // UICollectionViewDelegateFlowLayout отвечает за позицию верт или горизонтальную
    private lazy var titleBook: UILabel = {
        let view = UILabel()
        view.text = "BOOKS MAGAZINE"
        view.font = .boldSystemFont(ofSize: 20)
        
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
                view.delegate = self
                view.dataSource = self
                view.isPagingEnabled = true
                view.register(TestCellWork.self, forCellWithReuseIdentifier: "TestCellWork")
        
                return view

    }()
    
    private var books = ["1", "2", "3", "4", "5", "6", "7", "8"]
    
    private var price = ["Price: 120$", "Price: 33$", "Price: 57$", "Price: 21$", "Price: 5$", "Price: 98$", "Price: 65$", "Price: 55$"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
    }
    
    private func setupSubviews() {
                
        view.addSubview(titleBook)
                titleBook.snp.makeConstraints { make in
                    make.top.equalToSuperview().inset(50)
                    make.centerX.equalToSuperview()
                    
                }
        
        view.addSubview(collectionView)
                collectionView.snp.makeConstraints { make in
                    make.top.equalTo(titleBook.snp.bottom).offset(20);                  make.bottom.equalToSuperview()
                    make.left.right.equalToSuperview().inset(10)
                    
                }
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            return CGSize(
                width: (view.frame.width / 2) - 20,
                height: (view.frame.height / 3) - 5
         )
    
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return books.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let index = indexPath.row
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCellWork", for: indexPath) as! TestCellWork
            
            cell.titleView.image = UIImage(named: String(books[index]))
            
            cell.titlePrice.text = String(price[index]) ?? ""

            
//            cell.backgroundColor = UIColor(red: Double.random(in: 0...255) / 255.0, green: Double.random(in: 0...255) / 255.0, blue: Double.random(in: 0...255) / 255.0, alpha: Double.random(in: 0...255) / 255.0)
            
            
            
            return cell
        }

}



