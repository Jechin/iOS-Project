//
//  CompositionViewController.swift
//  CollectionViewProject
//
//  Created by 於泽辰 on 2022/11/24.
//

import UIKit
import SnapKit

class CompositionViewController: UIViewController {
    
    private let sections = ["Stories", "Popular", "Coming Soon"]
    private let storyImageIds = [1, 2, 3, 4, 5, 6, 7, 8]
    private let popularModels: [PopularModel] = [
        .init(imageId: 1, title: "火影忍者"),
        .init(imageId: 2, title: "咒术回战"),
        .init(imageId: 3, title: "鬼灭之刃"),
        .init(imageId: 4, title: "海贼王"),
        .init(imageId: 5, title: "七大罪")
    ]
    
    private let comingSoonModels: [ComingSoonModel] = [
        .init(imageId: 1, title: "间谍过家家"),
        .init(imageId: 2, title: "东京食尸鬼"),
        .init(imageId: 3, title: "终末的女武神"),
        .init(imageId: 4, title: "咒术回战"),
        .init(imageId: 5, title: "更多")
    ]
    
    private var animaCollectionview: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        setCollectionView()
        self.view.addSubview(animaCollectionview)
        animaCollectionview.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
        animaCollectionview.dataSource = self
        animaCollectionview.delegate = self
        
    }
    
    private func setCollectionView() {
        let layout = setCompisitionLayout()
        animaCollectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        animaCollectionview.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
        animaCollectionview.register(PopularCollectionViewCell.self, forCellWithReuseIdentifier: PopularCollectionViewCell.identifier)
        animaCollectionview.register(ComingSoonCollectionViewCell.self, forCellWithReuseIdentifier: ComingSoonCollectionViewCell.identifier)
        animaCollectionview.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        
        animaCollectionview.showsVerticalScrollIndicator = true
        animaCollectionview.showsHorizontalScrollIndicator = false
    }
    
    private func setCompisitionLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            if sectionIndex == 0 {
                let item = NSCollectionLayoutItem(layoutSize: .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(widthDimension: .absolute(70), heightDimension: .absolute(70)),
                    subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 10, bottom: 10, trailing: 10)
                section.interGroupSpacing = 10
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
            }else if sectionIndex == 1 {
                let item = NSCollectionLayoutItem(layoutSize: .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.6)),
                    subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                section.contentInsets = .init(top: 0, leading: 10, bottom: 30, trailing: 10)
                section.interGroupSpacing = 10
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
            }else {
                let item = NSCollectionLayoutItem(layoutSize: .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(widthDimension: .absolute(170), heightDimension: .absolute(80)),
                    subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
                section.interGroupSpacing = 10
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
            }
        }
        return layout
    }

    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
}

extension CompositionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch self.sections[section] {
        case "Stories":
            return self.storyImageIds.count
        case "Popular":
            return self.popularModels.count
        case "Coming Soon":
            return self.comingSoonModels.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch self.sections[indexPath.section] {
        case "Stories":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as! StoryCollectionViewCell
            cell.setImage(imageID: self.storyImageIds[indexPath.item])
            return cell
        case "Popular":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.identifier, for: indexPath) as! PopularCollectionViewCell
            cell.setContent(model: self.popularModels[indexPath.item])
            return cell
        case "Coming Soon":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ComingSoonCollectionViewCell.identifier, for: indexPath) as! ComingSoonCollectionViewCell
            cell.setContent(model: comingSoonModels[indexPath.item])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
            header.setContext(section: self.sections[indexPath.section])
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
    
}
