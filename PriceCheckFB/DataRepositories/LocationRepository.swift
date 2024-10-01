// Created by Prof. H in 2022
// Part of the PriceCheckFB project
// Using Swift 5.0
// Qapla'


import Combine
// import Firebase modules here
import Firebase
import FirebaseFirestore

class LocationRepository: ObservableObject {
  // Set up properties here
  @Published var locations: [Location] = []
  private var db = Firestore.firestore()
  
  init() {
    get()
  }

  func get() {
      db.collection("location_scans").getDocuments { (querySnapshot, error) in
          guard let documents = querySnapshot?.documents else {
              print("Error fetching documents: \(error?.localizedDescription ?? "Unknown error")")
              return
          }
          self.locations = documents.compactMap { document -> Location? in
              let location = try? document.data(as: Location.self)
              if var fetchedLocation = location {
                  let modifiedScans = fetchedLocation.scans.map { scan -> PriceScan in
                      var modifiedScan = scan
                      modifiedScan.id = UUID(uuidString: scan.id)?.uuidString ?? UUID().uuidString
                      return modifiedScan
                  }
                  fetchedLocation.scans = modifiedScans
                  return fetchedLocation
              }
              return location
          }
      }
  }
}
