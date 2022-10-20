//
//  HomeViewController.swift
//  CarrotHomeTab
//
//  Created by 오예진 on 2022/10/14.
//

import UIKit
import Combine

// 홈 뷰모델 만들기 (리스트 가져오고, 아이템이 탭됐을 때 행동 정의)
// 뷰모델은 리스트 가져오기

class HomeViewController: UIViewController {
    
    let viewModel: HomeViewModel = HomeViewModel(network: NetworkService(configuration: .default))
    var subscriptions = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.fetch()   // viewModel에 정의된 서버데이터 받는 fetch()
    }
    
    private func bind() {
        // viewModel의 items가 세팅이 되면 main thread에서 받아서 view에 보여주기
        viewModel.$items
            .receive(on: RunLoop.main)
            .sink { items in
                print("--> update collection view \(items)")
            }.store(in: &subscriptions)
        
        viewModel.itemTapped
            .sink { item in
                let sb = UIStoryboard(name: "Detail", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }.store(in: &subscriptions)
    }
    
}
