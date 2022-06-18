//
//  LevelView.swift
//  BubbleLevel
//
//  Created by Xcode2021 on 2022/05/26.
//

import SwiftUI
//import MapKit

struct LevelView: View {
    @EnvironmentObject var motionDetector: MotionDetector

    /*@State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.6809591, longitude: 139.7673068), span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0))*/

    var body: some View {
        VStack {
            /*Map(coordinateRegion: $region)
            OrientationDataView()
                .padding(.top, 80)*/
            BubbleLevel()
        }
        .onAppear {
            motionDetector.start()
        }
        .onDisappear {
            motionDetector.stop()
        }
    }
}

struct LevelView_Previews: PreviewProvider {
    @StateObject static var motionDetector = MotionDetector(updateInterval: 0.01).started()

    static var previews: some View {
        LevelView()
            .environmentObject(motionDetector)
    }
}

