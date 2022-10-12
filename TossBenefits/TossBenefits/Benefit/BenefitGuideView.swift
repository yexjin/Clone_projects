//
//  BenefitGuideView.swift
//  TossBenefits
//
//  Created by 오예진 on 2022/10/12.
//

import UIKit

final class BenefitGuideView: UIView {  // UIView를 상속받아서 보여줌
    
    lazy var icon: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var title: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented ")
    }
    
    // setup 에서 할 일
    /// label과 image view를 GuideView 안에 추가할 것
    private func setup() {
        addSubview(icon)
        addSubview(title)
        
        // icon auto layout 설정
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: self.leadingAnchor), // 좌측
            icon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            icon.widthAnchor.constraint(equalToConstant: 30),
            icon.heightAnchor.constraint(equalToConstant: 30),
        ])
        
        // title auto layout 설정
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 20),  // icon의 오른쪽 끝에서 20 정도 title의 좌측이 떨어져있게끔
            title.centerYAnchor.constraint(equalTo: icon.centerYAnchor)
        ])
    }
}
