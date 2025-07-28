//
//  ContentView.swift
//  トマトタイマー
//
//  Created by KOJI OSAKI on 2025/07/25.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("TodayTime") var TodayTime = 0
    var timeConvertor: DateComponentsFormatter {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.hour, .minute, .second]
        return formatter
    }
    var body: some View {
        ZStack {
            TabView {
                Tab("ホーム", systemImage: "house") {
                        Home()
                }
                Tab("統計", systemImage: "book") {
                    History()
                }
                Tab("休憩", systemImage: "bag") {
                    BreakTimer()
                }
                Tab("Start", systemImage: "pencil", role: .search) {
                    StudyTimer()
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
