//
//  OrientationDataView.swift
//  BubbleLevel
//
//  Created by Xcode2021 on 2022/05/26.
//

import SwiftUI

struct OrientationDataView: View {
    @EnvironmentObject var detector: MotionDetector

    var rollString: String {
        detector.roll.describeAsFixedLengthString()
    }
    var pitchString: String {
        detector.pitch.describeAsFixedLengthString()
    }

    var body: some View {
        VStack {
            Text(detector.region.center.latitude.describeAsFixedLengthString(integerDigits: 3, fractionDigits: 6))
                .font(.system(.body, design: .monospaced))
            Text(detector.region.center.longitude.describeAsFixedLengthString(integerDigits: 3, fractionDigits: 6))
                .font(.system(.body, design: .monospaced))
            /*Text("Horizontal: " + rollString)
                .font(.system(.body, design: .monospaced))
            Text("Vertical: " + pitchString)
                .font(.system(.body, design: .monospaced))*/
            //追加
            /*Text("データ1: " + detector.roll.describeAsFixedLengthString())
                .font(.system(.body, design: .monospaced))
            Text("データ2: " + detector.pitch.describeAsFixedLengthString())
                .font(.system(.body, design: .monospaced))
            Text("データ3: " + detector.zAcceleration.describeAsFixedLengthString(integerDigits: 10, fractionDigits: 4))
                .font(.system(.body, design: .monospaced))*/
        }
    }
}

struct OrientationDataView_Previews: PreviewProvider {
    @StateObject static private var motionDetector = MotionDetector(updateInterval: 0.01).started()

    static var previews: some View {
        OrientationDataView()
            .environmentObject(motionDetector)
    }
}
