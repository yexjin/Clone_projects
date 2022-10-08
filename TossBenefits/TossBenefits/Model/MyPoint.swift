//
//  MyPoint.swift
//  TossBenefits
//
//  Created by 오예진 on 2022/10/08.
//

import Foundation

struct MyPoint: Hashable {
    var point: Int
}

extension MyPoint {
    
    // ``로 예약어를 표시해주면 MyPoint.default로 사용가능
    static let `default` = MyPoint(point: 0)
}
