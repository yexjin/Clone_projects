//
//  DetailViewModel.swift
//  CarrotHomeTab
//
//  Created by 오예진 on 2022/10/21.
//

import Foundation
import Combine

final class DetailViewModel {
    
    let network: NetworkService
    let itemInfo: ItemInfo
    
    @Published var itemInfoDetails: ItemInfoDetails? = nil
    
    init(network: NetworkService, itemInfo: ItemInfo) {
        self.network = network
        self.itemInfo = itemInfo
    }
    
    func fetch() {
        // simulate network like behavior (비동기적)
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) {
            self.itemInfoDetails = ItemInfoDetails()
        }
//        let resources: Resource<ItemInfoDetails> = Resource(base: <#T##String#>, path: <#T##String#>, params: [ : ], header: [:])
//
//        network.load(resources)
//            .receive(on: RunLoop.main)
    }
}
