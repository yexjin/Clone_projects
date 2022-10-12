//
//  BenefitLIstViewController.swift
//  TossBenefits
//
//  Created by 오예진 on 2022/10/08.
//

import UIKit
import Combine

class BenefitListViewController: UIViewController {
    
//     - 사용자는 포인트를 볼 수 있다.
//     - 사용자는 오늘의 혜텍을 볼 수 있다.
//     - 사용자는 나머지 혜택 리스트를 볼 수 있다.
//
//     - 사용자는 포인트 셀을 눌렀을 때, 포인트 상세 뷰로 넘어간다.
//     - 사용자는 혜택 셀을 눌렀을 때, 혜택 상세 뷰로 넘어간다.
 
    @IBOutlet weak var collectionView: UICollectionView!
    
    typealias Item = AnyHashable
    
    enum Section: Int {
        case today
        case other
    }
    
    var datasource: UICollectionViewDiffableDataSource<Section, Item>!
    
//    var todaySectionItems: [AnyHashable] = TodaySectionItem(point: .default, today: .today).sectionItems
//    var otherSectionItems: [AnyHashable] = Benefit.others  // 나머지 혜택
    
    @Published var todaySectionItems: [AnyHashable] = []
    @Published var otherSectionItems: [AnyHashable] = []
    
    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datasource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            
            // section 별로 cell을 가져와서 return (indexPath에 section의 정보가 있음 (Section)
            guard let section = Section(rawValue: indexPath.section) else { return nil }
                let cell = self.configureCell(for: section, item: item, collectionView: collectionView, indexPath: indexPath)
                    
                return cell
        })

        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.today, .other])
        snapshot.appendItems(todaySectionItems, toSection: .today)
        snapshot.appendItems(otherSectionItems, toSection: .other)
        datasource.apply(snapshot)
        
        collectionView.collectionViewLayout = layout()
        collectionView.delegate = self

        navigationItem.title = "혜택"
        
        bind() 
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // main thread에서 0.5초 뒤에 로저를 실행한다.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.todaySectionItems = TodaySectionItem(point: .default, today: .today).sectionItems
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.otherSectionItems = Benefit.others  // 나머지 혜택
        }
    }
    
    private func bind() {
        
        $todaySectionItems
            .receive(on: RunLoop.main)
            .sink{ items in
                // item 이 들어오면 snapshot에 반영하기
                self.applySnapshot(items: items, section: .today)
            }.store(in: &subscriptions )
        
        $otherSectionItems
            .receive(on: RunLoop.main)
            .sink{ items in
                // item 이 들어오면 snapshot에 반영하기
                self.applySnapshot(items: items, section: .other)
            }.store(in: &subscriptions )
    }
    
    private func applySnapshot(items: [Item], section: Section) {
        var snapshot = datasource.snapshot()
        snapshot.appendItems(items, toSection: section)
        datasource.apply(snapshot)
    }
    
    
    private func configureCell(for section: Section, item: Item, collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell? {
        
        switch section {
        case .today:
            if let point = item as? MyPoint {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyPointCell", for: indexPath) as! MyPointCell
                cell.configure(item: point)
                return cell
            } else if let benefit = item as? Benefit {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodayBenefitCell", for: indexPath) as! TodayBenefitCell
                cell.configure(item: benefit)
                return cell
            } else {
                return nil
            }
        case .other:
            if let benefit = item as? Benefit {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BenefitCell", for: indexPath) as! BenefitCell
                cell.configure(item: benefit)
                return cell
            } else {
                return nil
            }
        }
    }
    
    
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let spacing: CGFloat = 10
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(60))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(60))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        
        // section 간 spacing 주기 -> contentInsets 설정
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 16, bottom: 0, trailing: 16)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
 
}

extension BenefitListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let item = datasource.itemIdentifier(for: indexPath)
        
        if let benefit = item as? Benefit {
            
            let sb = UIStoryboard(name: "ButtonBenefit", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "ButtonBenefitViewController") as! ButtonBenefitViewController

            vc.benefit = benefit

            navigationController?.pushViewController(vc, animated: true)
            
        } else if let point = item as? MyPoint {
            
            let sb = UIStoryboard(name: "MyPoint", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "MyPointViewController") as! MyPointViewController

            vc.point = point

            navigationController?.pushViewController(vc, animated: true)
        } else {

        }
        
    }
}
