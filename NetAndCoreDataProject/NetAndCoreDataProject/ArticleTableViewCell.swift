//
//  ArticalTableViewCell.swift
//  NetAndCoreDataProject
//
//  Created by 於泽辰 on 2022/11/28.
//

import UIKit
import SnapKit

class ArticleTableViewCell: UITableViewCell {
    
    static let Identifier = "ArticleTableViewCell"

    private var pdfID: String?
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()
    private let publishTimeLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.backgroundColor = .clear
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(publishTimeLabel)

        iconImageView.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.width.height.equalTo(50)
            make.centerY.equalToSuperview()
        }
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.layer.cornerRadius = 5
        iconImageView.layer.masksToBounds = true

        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconImageView.snp.trailing).offset(10)
            make.trailing.equalTo(-20)
            make.top.equalTo(iconImageView.snp.top)
            make.height.equalTo(20)
        }
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 16)

        publishTimeLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.trailing.equalTo(titleLabel.snp.trailing)
            make.bottom.equalTo(iconImageView.snp.bottom)
            make.height.equalTo(20)
        }
        publishTimeLabel.textColor = .black.withAlphaComponent(0.5)
        publishTimeLabel.font = UIFont.systemFont(ofSize: 12)
    }

    func setupData(_ model: ArticleModel) {
        pdfID = model.pdfID
        titleLabel.text = model.title
        publishTimeLabel.text = model.publishTime
//        DispatchQueue.global().async { [weak self] in
//            if let url = URL(string: model.cover), let imageData = try? Data(contentsOf: url) {
//                DispatchQueue.main.async {
//                    if self?.pdfID == model.pdfID {
//                        self?.iconImageView.image = UIImage(data: imageData)
//                    }
//                }
//            }
//        }
        
        ImageTool.getImage(id: model.pdfID, downloadUrl: model.cover) { [weak self] image in
            if self?.pdfID == model.pdfID {
                self?.iconImageView.image = image
            }
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        iconImageView.image = nil
        publishTimeLabel.text = nil
    }
}

class ImageTool {
    static func getImage(id: String, downloadUrl: String? = nil, completionHandle: ((UIImage?) -> Void)?) {
        let savedImagePath = NSHomeDirectory() + "/tmp/\(id).jpeg"
        if FileManager.default.fileExists(atPath: savedImagePath), let imageData = try? Data(contentsOf: URL(filePath: savedImagePath)) {
            DispatchQueue.main.async {
                completionHandle?(UIImage(data: imageData))
            }
        } else {
            DispatchQueue.global().async {
                if let url = URL(string: downloadUrl ?? ""), let imageData = try? Data(contentsOf: url) {
                    FileManager.default.createFile(atPath: savedImagePath, contents: imageData)
                    DispatchQueue.main.async {
                        completionHandle?(UIImage(data: imageData))
                    }
                    
                } else {
                    DispatchQueue.main.async {
                        completionHandle?(nil)
                    }
                }
            }
        }
    }
}
