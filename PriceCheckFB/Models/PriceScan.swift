// Created by Prof. H in 2022
// Part of the PriceCheckFB project
// Using Swift 5.0
// Qapla'

import Foundation
import SwiftUI

struct PriceScan: Identifiable, Codable, Comparable {
    var id: String
    var item: String
    var date: String
    var price: Double

    enum CodingKeys: String, CodingKey {
        case id
        case item
        case date
        case price
    }

    func onDate() -> String {
        return Helper.getShortDate(self.date)
    }

    static func < (lhs: PriceScan, rhs: PriceScan) -> Bool {
        lhs.item < rhs.item
    }

    static let example = PriceScan(id: UUID().uuidString, item: "Charmin Soft 12 Mega Rolls", date: "2020-10-10T16:48:00", price: 14.79)
}

