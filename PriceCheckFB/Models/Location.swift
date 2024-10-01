// Created by Prof. H in 2022
// Part of the PriceCheckFB project
// Using Swift 5.0
// Qapla'

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore

struct Location: Identifiable, Codable, Comparable {
  @DocumentID var id: String?
  var name: String
  var scans: [PriceScan]
  
  // To conform to Codable protocol
  enum CodingKeys: String, CodingKey {
    case id
    case name = "location"
    case scans
  }
  
  // To conform to Comparable protocol
  static func < (lhs: Location, rhs: Location) -> Bool {
    lhs.name < rhs.name
  }
  
  static func == (lhs: Location, rhs: Location) -> Bool {
    lhs.name == rhs.name
  }
  
  // MARK: Example for SwiftUI
  static let example = Location(id: UUID().uuidString, name: "Target", scans: [PriceScan.example])
}

