//
//  ContentView.swift
//  トマトタイマー
//
//  Created by KOJI OSAKI on 2025/07/25.
//

import SwiftUI
import Combine

class sTime: ObservableObject {
    @AppStorage("today") var today: TimeInterval = 0
    @AppStorage("monthly") var monthly: TimeInterval = 0
    @AppStorage("yearly") var yearly: TimeInterval = 0
    @Published var studyInterval: TimeInterval = 50 * 60
    @Published var breakInterval: TimeInterval = 10 * 60
}

struct ContentView: View {
    @StateObject var stime = sTime()
    
    
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
                
                Tab("Start", systemImage: "pencil", role: .search) {
                    StudyTimer()
                }
            }
        }
        .environmentObject(stime)
    }
}

#Preview {
    ContentView().environmentObject(sTime())
}
