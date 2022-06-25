//
//  LevelView.swift
//  BubbleLevel
//
//  Created by Xcode2021 on 2022/05/26.
//

import SwiftUI


struct LevelView: View {
    @EnvironmentObject var motionDetector: MotionDetector

    var body: some View {
        NavigationView {
            BubbleLevel()
                .navigationTitle("Map")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: SettingView()) {
                            Text("setting")
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

