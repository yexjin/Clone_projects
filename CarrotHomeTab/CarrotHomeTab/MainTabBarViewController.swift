//
//  MainTabBarViewController.swift
//  CarrotHomeTab
//
//  Created by 오예진 on 2022/10/14.
//

import UIKit

// 탭이 눌릴때마다, 그에 맞는 네비게이션 바를 구성
// - 탭이 눌리는 것을 감지
// - 감지 후에, 그 탭에 맞게 네비게이션 바 구성을 업데이트

// 앱이 시작할 때, 네비게이션 아이템 설정을 완료하고 싶다.
// - 네비게이션 바를
class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
    }
    
    // TabBarContoller가 보여지기 시작하는 시점에
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateNavigationItem(vc: self.selectedViewController!)
    }
    
    // viewController에 따라서 navigation 업데이트
    private func updateNavigationItem(vc: UIViewController) {
        switch vc {
        case is HomeViewController:
            
            let titleConfig = CustomBarItemConfiguration(
                title: "공릉동",
                handler: { }
            )
            let titleItem = UIBarButtonItem.generate(with: titleConfig, width: nil)
            
            let searchConfig = CustomBarItemConfiguration(
                image:UIImage(systemName: "magnifyingglass"),
                handler: {print("--> search tapped")}
            )
            let searchItem = UIBarButtonItem.generate(with: searchConfig, width: 30)

            let feedConfig = CustomBarItemConfiguration(
                image:UIImage(systemName: "bell"),
                handler: {print("--> feed tapped")}
            )
            let feedItem = UIBarButtonItem.generate(with: feedConfig, width: 30)


            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [feedItem, searchItem] // 아이템 여러개 설정할 때는 Items로 하고 배열로 넣어주기
            navigationItem.backButtonDisplayMode = .minimal // 타이틀 말고 아이콘만 보이게 됨.
            
        case is MyTownViewController:
            
            let titleConfig = CustomBarItemConfiguration(
                title: "공릉동",
                handler: { }
            )
            let titleItem = UIBarButtonItem.generate(with: titleConfig, width: nil)
            
            let feedConfig = CustomBarItemConfiguration(
                image:UIImage(systemName: "bell"),
                handler: {print("--> feed tapped")}
            )
            let feedItem = UIBarButtonItem.generate(with: feedConfig, width: 30)


            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [feedItem] // 아이템 여러개 설정할 때는 Items로 하고 배열로 넣어주기
            navigationItem.backButtonDisplayMode = .minimal // 타이틀 말고 아이콘만 보이게 됨.
            
        case is ChatViewController:
            
            let titleConfig = CustomBarItemConfiguration(
                title: "채팅",
                handler: { }
            )
            let titleItem = UIBarButtonItem.generate(with: titleConfig, width: nil)
            let feedConfig = CustomBarItemConfiguration(
                image:UIImage(systemName: "bell"),
                handler: {print("--> feed tapped")}
            )
            let feedItem = UIBarButtonItem.generate(with: feedConfig, width: 30)

            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [feedItem] // 아이템 여러개 설정할 때는 Items로 하고 배열로 넣어주기
            navigationItem.backButtonDisplayMode = .minimal // 타이틀 말고 아이콘만 보이게 됨.
            
        case is MyProfileViewController:
            
            let titleConfig = CustomBarItemConfiguration(
                title: "나의 당근",
                handler: { }
            )
            let titleItem = UIBarButtonItem.generate(with: titleConfig, width: nil)
            let settingConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "gearshape"),
                handler: { print("--> setting tapped") }
            )
            let settingItem = UIBarButtonItem.generate(with: settingConfig, width: 30)

            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [settingItem]
            navigationItem.backButtonDisplayMode = .minimal // 타이틀 말고 아이콘만 보이게 됨.
            
        default:
            
            let titleConfig = CustomBarItemConfiguration(
                title: "나의 당근",
                handler: { }
            )
            let titleItem = UIBarButtonItem.generate(with: titleConfig, width: nil)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = []
            navigationItem.backButtonDisplayMode = .minimal // 타이틀 말고 아이콘만 보이게 됨.
            
        }
    }
}

// 어떤 Controller가 탭 되었는지 알 수 있음
extension MainTabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        updateNavigationItem(vc: viewController)
    }
}
