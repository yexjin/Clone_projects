//
//  ItemInfoCell.swift
//  CarrotHomeTab
//
//  Created by 오예진 on 2022/10/20.
//

import UIKit

class ItemInfoCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnail: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var numOfChatLabel: UILabel!
    @IBOutlet weak var numOfLikeLabel: UILabel!
    
    
    func configure(item: ItemInfo) {
        titleLabel.text = item.title
        descriptionLabel.text = item.location
        priceLabel.text = "\(item.price)원"
        numOfChatLabel.text = "\(item.numOfChats)"
        numOfLikeLabel.text = "\(item.numOfLikes)"
    }
}
