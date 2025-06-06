// The Swift Programming Language
// https://docs.swift.org/swift-book
//
//  File.swift
//  POISearcher
//
//  Created by Angela Dyrda on 6/6/25.
//

import Foundation
import MapKit

public final class POISearcher {
    public init() {}

    public func search(query: String, region: MKCoordinateRegion) async throws -> [MKMapItem] {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        request.region = region

        let search = MKLocalSearch(request: request)
        let response = try await search.start()

        return response.mapItems
    }
}
