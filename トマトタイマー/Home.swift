//
//  Home.swift
//  トマトタイマー
//
//  Created by KOJI OSAKI on 2025/07/25.
//

import SwiftUI


struct Home: View {
    @State var dateText = ""
    @State var nowDate = Date()
    @State var timeText = ""
    @State var nowTime = Date()
    @State var yearText = ""
    @State var nowYear = Date()
    @State var monthText = ""
    @State var nowMonth = Date()
    @State var dayText = ""
    @State var nowDay = Date()
    private let dateFormatter = DateFormatter()
    private let timeFormatter = DateFormatter()
    private let yearFormatter = DateFormatter()
    private let monthFormatter = DateFormatter()
    private let dayFormatter = DateFormatter()
    @State private var timerset25 = false
    @State private var timerset50 = false
    @EnvironmentObject var stime: sTime
    @AppStorage("preyear") private var preyear: Int = 0
    @AppStorage("premonth") private var premonth: Int = 0
    @AppStorage("preday") private var preday: Int = 0
    
    init() {
        dateFormatter.dateFormat = "MM月dd日 E曜日"
        dateFormatter.locale = Locale(identifier: "ja_jp")
        timeFormatter.dateFormat = "HH:mm"
        timeFormatter.locale = Locale(identifier: "ja_jp")
        yearFormatter.dateFormat = "yyyy"
        yearFormatter.locale = Locale(identifier: "ja_jp")
        monthFormatter.dateFormat = "MM"
        monthFormatter.locale = Locale(identifier: "ja_jp")
        dayFormatter.dateFormat = "dd"
        dayFormatter.locale = Locale(identifier: "ja_jp")
    }
    var body: some View {
        
        NavigationStack {
            ZStack {
                Image(.wall2)
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                
                VStack {
                    Text("ホーム")
                        .font(.title)
                        .bold()
                        .background(
                            Rectangle()
                                .foregroundStyle(.ultraThinMaterial)
                                .frame(width: 500, height:120)
                                .ignoresSafeArea()
                            )
                        .ignoresSafeArea()
                    Spacer()
                    Text(dateText.isEmpty ? "\(dateFormatter.string(from: nowDate))" : dateText)
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                                self.nowDate = Date()
                                dateText = "\(dateFormatter.string(from: nowDate))"
                            }
                        }
                        .foregroundColor(.black)
                        .shadow(color: .init(white: 2, opacity: 0.8), radius: 5, x: 0, y: 0)
                    
                    Text(timeText.isEmpty ? "\(timeFormatter.string(from: nowTime))" : timeText)
                        .font(.system(size: 100, weight: .bold, design: .rounded))
                        .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                                self.nowTime = Date()
                                timeText = "\(timeFormatter.string(from: nowTime))"
                            }
                        }
                        .foregroundColor(.black)
                        .shadow(color: .init(white: 3, opacity: 0.8), radius: 5, x: 0, y: 0)
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundStyle(.ultraThinMaterial)
                            .frame(width: 350, height: 200)
                            .shadow(color: .init(white: 0.4, opacity: 0.4), radius: 5, x: 0, y: 0)
                        VStack {
                            Text("今日の集中時間")
                                .multilineTextAlignment(.center)
                                .bold()
                                .font(.system(size: 25, weight: .bold, design: .rounded))
                                
                                .frame(width: 350, height: 30)
                            
                            Text(formatTime(stime.today))
                                .multilineTextAlignment(.center)
                                .bold()
                                .font(.system(size: 50, weight: .bold, design: .rounded))
                                
                                .frame(width: 350, height: 100)
                        }
                        
                    }
                    
                        
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundStyle(.ultraThinMaterial)
                            .frame(width: 350, height: 190)
                            .shadow(color: .init(white: 0.4, opacity: 0.4), radius: 5, x: 0, y: 0)
                        VStack {
                            Text("勉強サイクル")
                                .font(.system(size:25, weight: .bold, design: .rounded))
                                .frame(width: 350, height: 80)
                            HStack {
                                Button {
                                    timerset25 = true
                                    stime.studyInterval = 25 * 60
                                    stime.breakInterval = 5 * 60
                                    timerset50 = false
                                }label: {
                                    Text("25分")
                                        .font(.title)
                                        .foregroundStyle(Color.white)
                                        .frame(width: 150, height: 70)
                                        .background(timerset25 ? Color.gray:Color.blue)
                                        .clipShape(RoundedRectangle(cornerRadius: 30))
                                        
                                        
                                }
                                Button {
                                    timerset50 = true
                                    stime.studyInterval = 50 * 60
                                    stime.breakInterval = 10 * 60
                                    timerset25 = false
                                }label: {
                                    Text("50分")
                                        .font(.title)
                                        .foregroundStyle(Color.white)
                                        .frame(width: 150, height: 70)
                                        .background(timerset50 ? Color.gray:Color.blue)
                                        .clipShape(RoundedRectangle(cornerRadius: 30))
                                        
                                        
                                }
                        }
                        }
                        
                    
                        
                        
                    }
                    
                    Spacer()
                }.padding()
            }
        }
    }
    func formatTime(_ time: TimeInterval) -> String {
        let totalMinutes = Int(time) / 60
        let minutes = totalMinutes % 60
        let hours = totalMinutes / 60
        return String(format: "%02d時間%02d分",hours, minutes)
    }
    func reset() {
        let currentDay = Calendar.current.component(.day, from: nowDay)
        let currentMonth = Calendar.current.component(.month, from: nowMonth)
        let currentYear = Calendar.current.component(.year, from: nowYear)
        if preday != currentDay {
            preday = currentDay
            stime.today = 0
        }
        if premonth != currentMonth {
            premonth = currentMonth
            stime.today = 0
            stime.monthly = 0
        }
        if preyear != currentYear {
            preyear = currentYear
            stime.today = 0
            stime.monthly = 0
            stime.yearly = 0
        }
    }
}

#Preview {
    Home().environmentObject(sTime())
}

