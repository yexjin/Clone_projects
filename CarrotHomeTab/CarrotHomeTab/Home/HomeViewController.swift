//
//  HomeViewController.swift
//  CarrotHomeTab
//
//  Created by 오예진 on 2022/10/14.
//

import UIKit
import Combine

class HomeViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    typealias Item = ItemInfo
    enum Section {
        case main
    }
    var datasource: UICollectionViewDiffableDataSource<Section, Item>!
    
    let viewModel: HomeViewModel = HomeViewModel(network: NetworkService(configuration: .default))
    var subscriptions = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        bind()
        viewModel.fetch()
    }
    
    private func configureCollectionView() {
        datasource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectonView, indexPath, item in
            guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "ItemInfoCell", for: indexPath) as? ItemInfoCell else { return nil }
            cell.configure(item: item)
            return cell
        })
        
        collectionView.collectionViewLayout = layout()
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems([], toSection: .main)
        datasource.apply(snapshot)
        
        collectionView.delegate = self
    }
    
    private func applyItem(_ items: [ItemInfo]) {
        var snapshot = datasource.snapshot() // snapshot이 적용된 snapshot
        snapshot.appendItems(items, toSection: .main)    // main section에 적용
        datasource.apply(snapshot)
    }
    
    private func bind() {

        viewModel.$items
            .receive(on: RunLoop.main)
            .sink { items in
                self.applyItem(items)   // 이렇게 해서 collectionView에 item이 바로 적용되게!!
            }.store(in: &subscriptions)
        
        viewModel.itemTapped
            .sink { item in
                let sb = UIStoryboard(name: "Detail", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }.store(in: &subscriptions)
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(140))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(140))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
}
