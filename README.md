# POISearcher

A Swift Package that wraps Apple's `MKLocalSearch` for performing point-of-interest (POI) searches using `MapKit`.

---

## Requirements

- iOS 15.0+
- Swift 5.5+
- Xcode 13+

## Installation

### Using Xcode (Local Package)

1. Open your Xcode project.
2. Go to **File > Add Packages...**
3. Choose **Add Local...**
4. Select the folder containing the POISearcher Swift package.
5. Go to your app target's settings and select your app target.
6. Open the "General" tab.
7. Scroll to "Frameworks, Libraries, and Embedded Content".
8. Click the +, and select POISearcher.
9. Import POISearcher in your Swift file

## Usage
### Import the module in any Swift file where you want to use the POI search:

```swift
import POISearcher

let region = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // San Francisco
    span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
)

Task {
    do {
        let results = try await searcher.search(query: "Coffee", region: region)
        results.forEach { item in
        // Each item is an MKMapItem, representing a place found in the search
            print(item.name ?? "Unknown name")
        }
    } catch {
        print("Search failed: \(error)")
    }
}

This performs a search for nearby coffee shops using Apple’s MapKit and prints their names.
