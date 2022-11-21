//
//  MessageTableViewCell.swift
//  TableViewProject
//
//  Created by 於泽辰 on 2022/11/21.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    public static let identifier = "MessageTableViewCell"
    
    var portraitView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .black.withAlphaComponent(0.9)
        label.textAlignment = .left
        return label
    }()
    
    var abstractLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    var timeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(portraitView)
        portraitView.snp.makeConstraints { make in
            make.width.height.equalTo(48)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
        }
        
        self.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(19)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(14)
            make.width.equalTo(100)
        }
        
        self.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(portraitView.snp.right).offset(12)
            make.top.equalToSuperview().offset(14)
            make.height.equalTo(25)
            // 没有约束宽度
            make.right.equalTo(timeLabel.snp.left).offset(-15)
        }
        
        self.addSubview(abstractLabel)
        abstractLabel.snp.makeConstraints { make in
            make.left.equalTo(nameLabel.snp.left)
            make.top.equalTo(nameLabel.snp.bottom)
            make.height.equalTo(17)
            // 没有约束宽度
            make.right.equalTo(timeLabel.snp.right)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        portraitView.image = nil
        nameLabel.text = nil
        abstractLabel.text = nil
        timeLabel.text = nil
    }
}
