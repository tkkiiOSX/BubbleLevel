//
//  SettingView.swift
//  BubbleLevel
//
//  Created by Xcode2021 on 2022/06/25.
//

import SwiftUI



struct SettingView: View {
    @EnvironmentObject var motionDetector: MotionDetector

    var body: some View {
        VStack {
            ForEach(0 ..< motionDetector.Savelat.count, id: \.self) { i in

                HStack {
                    Text("緯度\(motionDetector.Savelat[i])")
                    Text("経度\(motionDetector.Savelng[i])")
                }


            }
            Text("番号")
            Text("登録時間")
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
    }
}
