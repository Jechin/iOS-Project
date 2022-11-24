//
//  PopularCollectionViewCell.swift
//  CollectionViewProject
//
//  Created by 於泽辰 on 2022/11/23.
//

import UIKit
import SnapKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    public static let identifier = "PopularCollectionViewCell"
    
    public var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25, weight: .medium)
        label.textColor = UIColor(named: "InverseText")
        label.backgroundColor = UIColor(named: "LabelBG")
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        self.contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.center.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        self.contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(30)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContent(model: PopularModel) {
        imageView.image = UIImage(named: "popular-\(model.imageId)")
        titleLabel.text = model.title
    }
    
}
