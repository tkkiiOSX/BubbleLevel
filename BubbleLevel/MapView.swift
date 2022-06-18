import SwiftUI
import UIKit
import MapKit

struct MapView: UIViewRepresentable {
    var lat: Double
    var lng: Double
    var type: MKMapType

    var zoom: Double

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat, longitude: lng), span: MKCoordinateSpan(latitudeDelta: zoom, longitudeDelta: zoom))
        uiView.mapType = type
        uiView.setRegion(region, animated: true)
        print("\(lat) \(lng)")
    }
}
