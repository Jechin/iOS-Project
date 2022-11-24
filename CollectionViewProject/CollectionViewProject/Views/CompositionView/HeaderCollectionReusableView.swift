//
//  HeaderCollectionReusableView.swift
//  CollectionViewProject
//
//  Created by 於泽辰 on 2022/11/24.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    public static let identifier = "HeaderCollectionReusableView"
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = UIColor(named: "Text")
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .heavy)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.center.height.equalToSuperview()
            make.left.equalToSuperview().offset(10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = nil
    }
    
    public func setContext(section: String) {
        self.titleLabel.text = section
    }
}
