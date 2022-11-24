//
//  StoryCollectionViewCell.swift
//  CollectionViewProject
//
//  Created by 於泽辰 on 2022/11/23.
//

import UIKit
import SnapKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    public static let identifier = "StoryCollectionViewCell"
    
    public var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        self.layer.cornerRadius = frame.width / 2
        self.layer.masksToBounds = true
        imageView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(imageID: Int) {
        imageView.image = UIImage(named: "profile-\(imageID)")
    }
}
