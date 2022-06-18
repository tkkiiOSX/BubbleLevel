
import SwiftUI
import MapKit


struct BubbleLevel: View {

    @EnvironmentObject var detector: MotionDetector
    @State var lat = 35.6809591
    @State var lng = 139.7673068
    @State var type = MKMapType.standard

    var body: some View {
        VStack {
            MapView(lat: lat,
                    lng: lng,
                    type: type,
                    zoom: 1.0)

            MapView(lat: lat,
                    lng: lng,
                    type: type,
                    zoom: 0.001)
            Text("\(detector.region.center.latitude)")
            Text("\(detector.region.center.longitude)")
            Picker(selection: $type, label: Text("Picker")) {
                Text("standard").tag(MKMapType.standard)
                Text("satellite").tag(MKMapType.satellite)
                Text("satellite+MAP").tag(MKMapType.hybrid)
                Text("hybridFlyover").tag(MKMapType.hybridFlyover)
                Text("satelliteFlyover").tag(MKMapType.satelliteFlyover)
                Text("mutedStandard").tag(MKMapType.mutedStandard)
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                lat = detector.region.center.latitude
                lng = detector.region.center.longitude
            }
        }
    }
}

struct BubbleLevel_Previews: PreviewProvider {
    @StateObject static var motionDetector = MotionDetector(updateInterval: 0.01).started()

    static var previews: some View {
        BubbleLevel()
            .environmentObject(motionDetector)
    }
}
