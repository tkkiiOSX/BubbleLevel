//
//  SettingView.swift
//  BubbleLevel
//
//  Created by Xcode2021 on 2022/06/25.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        VStack {
            Text("現在緯度経度")
            Text("登録緯度経度")
            Text("選択緯度経度")
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
