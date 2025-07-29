//
//  ContentView.swift
//  トマトタイマー
//
//  Created by KOJI OSAKI on 2025/07/25.
//

import SwiftUI
import Combine

class sTime: ObservableObject {
    @Published var today: TimeInterval = 0
    @Published var monthly: TimeInterval = 0
    @Published var yearly: TimeInterval = 0
    @Published var studyInterval: TimeInterval = 1
    @Published var breakInterval: TimeInterval = 1
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
