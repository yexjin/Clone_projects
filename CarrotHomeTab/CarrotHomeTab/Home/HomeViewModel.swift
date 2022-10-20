//
//  HomeViewModel.swift
//  CarrotHomeTab
//
//  Created by 오예진 on 2022/10/20.
//

import Foundation
import Combine

final class HomeViewModel {
    // 네트워크 연결
    let network: NetworkService
    
    // viewController가 Binding이 가능하게 Published 설정
    @Published var items: [ItemInfo] = []
    var subscriptions = Set<AnyCancellable>()
    
    let itemTapped = PassthroughSubject<ItemInfo, Never>()
    
    // 네트워크 init
    init(network: NetworkService) {
        self.network = network
    }
    
    func fetch() {
        // resource가 서버 어디에 있는지?!
        let resource: Resource<[ItemInfo]> = Resource(
            base: "https://my-json-server.typicode.com/",
            path: "cafielo/demo/products",
            params: [:],
            header: ["Content-Type": "application/json"]    // content는 json으로 받겠다
        )
        
        // decoding 과정
        network.load(resource)  // 만든 resource로 로드
            .receive(on: RunLoop.main)  // resource를 main thread에서 받음
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("--> error: \(error)")
                case .finished:
                    print("--> finished")
                }
            } receiveValue: { items in
                self.items = items
            }.store(in: &subscriptions)
    }
}
