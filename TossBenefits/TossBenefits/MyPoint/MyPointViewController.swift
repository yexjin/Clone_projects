//
//  MyPointViewController.swift
//  TossBenefits
//
//  Created by 오예진 on 2022/10/09.
//

import UIKit

class MyPointViewController: UIViewController {
    
    @IBOutlet weak var pointLabel: UILabel!
    var point: MyPoint = .default

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
    }
}
