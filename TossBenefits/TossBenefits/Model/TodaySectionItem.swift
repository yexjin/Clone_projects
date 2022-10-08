//
//  TodaySectionItem.swift
//  TossBenefits
//
//  Created by 오예진 on 2022/10/08.
//

import Foundation

struct TodaySectionItem {
    var point: MyPoint
    var today: Benefit
    
    var sectionItems: [AnyHashable] {
        return [point, today]
    }
}

extension TodaySectionItem {
    // 초기 기본 값
    static let mock = TodaySectionItem (
        point: MyPoint(point: 0),
        today: Benefit.walk 
    )
}
