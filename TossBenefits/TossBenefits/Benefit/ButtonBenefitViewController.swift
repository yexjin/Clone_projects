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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        ctaButton.layer.masksToBounds = true
        ctaButton.layer.cornerRadius = 5
        
        ctaButton.setTitle(benefit.title, for: .normal)

    }
    


}
