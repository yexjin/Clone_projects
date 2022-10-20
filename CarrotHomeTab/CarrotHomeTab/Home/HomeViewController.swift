//
//  HomeViewController.swift
//  CarrotHomeTab
//
//  Created by 오예진 on 2022/10/14.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
 
    @IBAction func ctaButtonTapped(_ sender: Any) {
        
        let sb = UIStoryboard(name: "Detail", bundle: nil)
        
        let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
