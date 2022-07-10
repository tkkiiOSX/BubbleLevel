//
//  LevelView.swift
//  BubbleLevel
//
//  Created by Xcode2021 on 2022/05/26.
//

import SwiftUI


struct LevelView: View {
    @EnvironmentObject var motionDetector: MotionDetector

    //@State var Savelat: [Double] = []
    //@State var Savelng: [Double] = []

    var body: some View {
        NavigationView {
            BubbleLevel()
                .navigationTitle("Map")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            Button("緯度経度Save") {
                                motionDetector.saveLat.append(motionDetector.region.center.latitude)
                                motionDetector.saveLng.append(motionDetector.region.center.longitude)
                                motionDetector.saveTim.append(Date())
                            }

                            NavigationLink(destination: SettingView()) {
                                Text("setting")
                            }
                        }

                    }
                }
        }
        .navigationViewStyle(.stack)
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

