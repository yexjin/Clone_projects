//
//  DetailViewController.swift
//  CarrotHomeTab
//
//  Created by 오예진 on 2022/10/14.
//

import UIKit

class DetailViewController: UIViewController {
    
    var viewModel: DetailViewModel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.fetch()
    }

    private func bind() {
        
    }

}
