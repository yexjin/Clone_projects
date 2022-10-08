//
//  BenefitLIstViewController.swift
//  TossBenefits
//
//  Created by 오예진 on 2022/10/08.
//

import UIKit

class BenefitListViewController: UIViewController {
    
//     - 사용자는 포인트를 볼 수 있다.
//     - 사용자는 오늘의 혜텍을 볼 수 있다.
//     - 사용자는 나머지 혜택 리스트를 볼 수 있다.
//
//     - 사용자는 포인트 셀을 눌렀을 때, 포인트 상세 뷰로 넘어간다.
//     - 사용자는 혜택 셀을 눌렀을 때, 혜택 상세 뷰로 넘어간다.
 
    @IBOutlet weak var collectionView: UICollectionView!
    
    typealias Item = AnyHashable
    
    enum Section {
        case today
        case other
    }
    
    var datasource: UICollectionViewDiffableDataSource<Section, Item>!
    
    var todaySectionItems: [AnyHashable] = TodaySectionItem(point: .default, today: .today).sectionItems
    var otherSectionItems: [AnyHashable] = Benefit.others  // 나머지 혜택
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datasource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            
            // section 별로 cell을 가져와서 return
            guard let section = indexPath.section
                    let cell =
                    
                    return cell
            
            return nil
            
        })

        navigationItem.title = "혜택"
    }
    

}
