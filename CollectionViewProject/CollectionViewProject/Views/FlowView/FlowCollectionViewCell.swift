//
//  FlowCollectionViewCell.swift
//  CollectionViewProject
//
//  Created by 於泽辰 on 2022/11/23.
//

import UIKit
import SnapKit

class FlowCollectionViewCell: UICollectionViewCell {
    public static let identifier = "FlowCollectionViewCell"
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.right.left.top.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    }
    
    public func setImage(photoID: Int) {
        self.imageView.image = UIImage(named: "photo-\(photoID)")
    }
}
