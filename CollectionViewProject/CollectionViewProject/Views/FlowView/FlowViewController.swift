//
//  FlowViewController.swift
//  CollectionViewProject
//
//  Created by 於泽辰 on 2022/11/23.
//

import UIKit
import SnapKit

class FlowViewController: UIViewController {
    
    private var photoIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14,
                            1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14,
                            1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
    
    private let flowCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 4 - 3,
                                 height: UIScreen.main.bounds.width / 4 - 3)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FlowCollectionViewCell.self, forCellWithReuseIdentifier: FlowCollectionViewCell.identifier)
        collectionView.showsVerticalScrollIndicator = true
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        self.view.addSubview(flowCollectionView)
        flowCollectionView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        flowCollectionView.delegate = self
        flowCollectionView.dataSource = self
    }
}

extension FlowViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photoIds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlowCollectionViewCell.identifier, for: indexPath) as? FlowCollectionViewCell {
            cell.setImage(photoID: self.photoIds[indexPath.item])
            
            return cell
        }else{
            return UICollectionViewCell()
        }
    }
    
    
}
