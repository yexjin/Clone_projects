//
//  ButtonBenefitViewController.swift
//  TossBenefits
//
//  Created by 오예진 on 2022/10/12.
//

import UIKit

class ButtonBenefitViewController: UIViewController {
    
    var benefit: Benefit = .today
    var benefitDetails: BenefitDetails = .default

    @IBOutlet weak var ctaButton: UIButton!
    @IBOutlet weak var vStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupUI()
        addGuides()
        
        ctaButton.setTitle(benefit.title, for: .normal)

    }
    
    private func setupUI() {
        navigationItem.largeTitleDisplayMode = .never
        ctaButton.layer.masksToBounds = true
        ctaButton.layer.cornerRadius = 5
    }
    
    private func addGuides() {
        let guideViews: [BenefitGuideView] = benefitDetails.guides.map { guide in
            let guideView = BenefitGuideView(frame: .zero)
            guideView.icon.image = UIImage(systemName: guide.iconName)
            guideView.title.text = guide.guide
            return guideView
        }
        
        // 코드로 StackView에 신규 뷰 추가하기
        guideViews.forEach { view in
            self.vStackView.addArrangedSubview(view)
            
            // autolayout으로 높이 설정
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 60)
            ])
        }
    }
    


}
