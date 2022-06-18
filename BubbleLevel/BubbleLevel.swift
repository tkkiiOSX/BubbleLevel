
import SwiftUI
import MapKit


struct BubbleLevel: View {

    @EnvironmentObject var detector: MotionDetector
    @State var lat = 35.6809591
    @State var lng = 139.7673068
    @State var type = MKMapType.standard
    @State var tmp1 = 0.001
    @State var tmp2 = 0.001

    var body: some View {
        VStack {
            MapView(lat: lat,
                    lng: lng,
                    type: type,
                    zoom: tmp1)



            MapView(lat: lat,
                    lng: lng,
                    type: type,
                    zoom: tmp2)


                Stepper(value: $tmp1, in: 0.01 ... 1.00) {
                    Text("上側拡大縮小\(tmp1)")
                }
                Stepper(value: $tmp2, in: 0.01 ... 1.00) {
                    Text("下側拡大縮小\(tmp2)")
                }

                //Slider(value: $tmp2, in: 0.01 ... 1.0, step: 0.01)


            VStack {
                Text("緯度\(detector.region.center.latitude)")
                Text("経度\(detector.region.center.longitude)")
                Picker(selection: $type, label: Text("Picker")) {
                    Text("standard").tag(MKMapType.standard)
                    Text("satellite").tag(MKMapType.satellite)
                    Text("satellite+MAP").tag(MKMapType.hybrid)
                    Text("hybridFlyover").tag(MKMapType.hybridFlyover)
                    Text("satelliteFlyover").tag(MKMapType.satelliteFlyover)
                    Text("mutedStandard").tag(MKMapType.mutedStandard)
                }
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
