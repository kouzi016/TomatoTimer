//
//  StudyTimer.swift
//  トマトタイマー
//
//  Created by KOJI OSAKI on 2025/07/28.
//

import SwiftUI

struct StudyTimer: View {
    @State private var showBreakTimer = false
    @State private var remainingStudyTime : TimeInterval = 50 * 60
    @State private var stimerActive = false
    @EnvironmentObject var stime: sTime
    @State private var stutimer: Timer?
    var body: some View {
        NavigationStack {
            ZStack {
                Color.studyTime.ignoresSafeArea()
                VStack {
                    Text("勉強中")
                        .font(.title)
                        .bold()
                        .frame(width: 500, height:150)
                        .background(
                            Rectangle()
                                .foregroundStyle(.ultraThinMaterial)
                                .frame(width: 500, height:100)
                                .ignoresSafeArea()
                        )
                        .ignoresSafeArea()
                    Spacer()
                    Text("残り")
                        .font(.title)
                        .frame(maxWidth: 300, alignment: .leading)
                        .foregroundStyle(Color.black)
                        .bold()
                    Text("\(formatTime(remainingStudyTime))")
                        .font(.system(size: 100, weight: .bold, design: .rounded))
                        .foregroundStyle(Color.black)
                    Spacer()
                    HStack {
                        Button {
                            stimerActive.toggle()
                            if stimerActive {
                                startTimer()
                            }else {
                                stutimer?.invalidate()
                            }
                        }label: {
                            Text(stimerActive ? "一時停止":"再開")
                                .font(.title)
                                .foregroundStyle(Color.white)
                                .frame(width: 150, height: 70)
                                .background(Color.gray)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                        }
                        Button {
                            stutimer?.invalidate()
                            stimerActive = false
                            remainingStudyTime = stime.studyInterval
                            showBreakTimer = true
                        }label: {
                            Text("終了")
                                .font(.title)
                                .foregroundStyle(Color.white)
                                .frame(width: 150, height: 70)
                                .background(Color.red)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                        }
                    }
                    Spacer()
                    NavigationLink("", destination: BreakTimer(), isActive: $showBreakTimer)
                        .opacity(0)
                }
                .onDisappear {
                    stimerActive = false
                    stutimer?.invalidate()
                }
            }
            .onAppear {
                remainingStudyTime = stime.studyInterval
                startTimer()
            }
        }
    }
    func startTimer() {
        stimerActive = true
        stutimer?.invalidate()
        stutimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if remainingStudyTime > 0 {
                stime.today += 1
                stime.monthly += 1
                stime.yearly += 1
                remainingStudyTime -= 1
            } else {
                stimerActive = false
                stutimer?.invalidate()
                showBreakTimer = true
            }
        }
    }
    func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}


#Preview {
    StudyTimer().environmentObject(sTime())
}
