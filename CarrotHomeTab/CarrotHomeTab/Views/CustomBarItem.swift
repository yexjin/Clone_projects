//
//  CustomBarItem.swift
//  CarrotHomeTab
//
//  Created by 오예진 on 2022/10/18.
//

import Foundation
import UIKit


struct CustomBarItemConfiguration {
    
    // 표현이 복잡하거나 한눈에 보기 어려울 때 typealias 사용
    // closer 타입을 "Handler" 라는 이름의 타입으로 재설정
    typealias Handler = () -> Void
    
    let title: String?
    let image: UIImage?
    let handler: Handler
    
    init(title: String? = nil, image: UIImage? = nil, handler: @escaping Handler) {
        self.title = title
        self.image = image
        self.handler = handler
    }
}


// CustomBarButton을 위한 UIButton을 상속한 CustomBarItem
final class CustomBarItem: UIButton {
    // title, image, target action 필요
        
    var customBarItemConfig: CustomBarItemConfiguration
    
    init(config: CustomBarItemConfiguration) {
        self.customBarItemConfig = config
        super.init(frame: .zero)
        setupStyle()
        updateConfig()

    }
    
    private func setupStyle() {
        self.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        self.titleLabel?.textColor = .white
        self.imageView?.tintColor = .white
        
    }
    
    private func updateConfig() {
        self.setTitle(customBarItemConfig.title, for: .normal)
        self.setImage(customBarItemConfig.image, for: .normal)
    }
    
    @objc func buttonTapped() {
        customBarItemConfig.handler()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
