//
//  ComingSoonCollectionViewCell.swift
//  CollectionViewProject
//
//  Created by 於泽辰 on 2022/11/24.
//

import UIKit
import SnapKit

class ComingSoonCollectionViewCell: UICollectionViewCell {
    
    public static let identifier = "ComingSoonCollectionViewCell"
    
    public var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = UIColor(named: "InverseText")
        label.backgroundColor = UIColor(named: "LabelBG")
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        imageView.snp.makeConstraints { make in
            make.top.bottom.left.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.35)
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.bottom.right.equalToSuperview()
            make.left.equalTo(imageView.snp.right)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
        self.titleLabel.text = nil
    }
    
    public func setContent(model: ComingSoonModel) {
        self.imageView.image = UIImage(named: "soon-\(model.imageId)")
        self.titleLabel.text = model.title
    }
    
}
