//
//  BubbleLevelApp.swift
//  BubbleLevel
//
//  Created by Xcode2021 on 2022/05/26.
//

import SwiftUI

@main
struct BubbleLevelApp: App {
    @StateObject private var motionDetector = MotionDetector(updateInterval: 0.1)

    var body: some Scene {
        WindowGroup {
            LevelView()
                .environmentObject(motionDetector)
        }
    }
}
