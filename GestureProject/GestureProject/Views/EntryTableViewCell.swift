//
//  EntryTableViewCell.swift
//  GestureProject
//
//  Created by 於泽辰 on 2022/11/27.
//

import UIKit
import SnapKit

class EntryTableViewCell: UITableViewCell {
    public static let identifier = "EntryTableViewCell"

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = UIColor(named: "Text")
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 25, weight: .medium)
        return label
    }()
    
    private var describeLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = UIColor(named: "Text")
        label.textAlignment = .left
        label.numberOfLines  = 0
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        
        self.addSubview(describeLabel)
        describeLabel.snp.makeConstraints { make in
            make.centerX.bottom.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        self.prepareForReuse()
        self.titleLabel.text = nil
        self.describeLabel.text = nil
    }
    
    public func setContent(title: String, describe: String) {
        self.titleLabel.text = title
        self.describeLabel.text = describe
    }
}
