//
//  SettingView.swift
//  BubbleLevel
//
//  Created by Xcode2021 on 2022/06/25.
//

import SwiftUI



struct SettingView: View {
    @EnvironmentObject var motionDetector: MotionDetector
    var dateF: DateFormatter {

        let f = DateFormatter()
        f.timeStyle = .short
        f.dateStyle = .short
        f.locale = Locale(identifier: "ja_JP")
        return f
    }
    var body: some View {
        VStack {
            ForEach(0 ..< motionDetector.saveLat.count, id: \.self) { i in

                HStack {
                    Text("No.\(i + 1)")
                    Text("緯度\(motionDetector.saveLat[i])")
                    Text("経度\(motionDetector.saveLng[i])")
                    Text("日時" + dateF.string(from: motionDetector.saveTim[i]))
                    Button("読み出し\(i + 1)") {

                        motionDetector.region.center.latitude = motionDetector.saveLat[i]
                        motionDetector.region.center.longitude = motionDetector.saveLng[i]
                    }
                }


            }


            Text("メモ")
            Text("選択緯度経度")
            Text("登録緯度経度")
            
            Text("緯度経度入力")
        }
        .navigationTitle("Setting")
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .environmentObject(MotionDetector(updateInterval: 0.1))
    }
}
