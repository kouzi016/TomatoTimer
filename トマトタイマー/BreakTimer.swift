//
//  BreakTimer.swift
//  トマトタイマー
//
//  Created by KOJI OSAKI on 2025/07/28.
//

import SwiftUI

struct BreakTimer: View {
    @State private var remainingBreakTime : TimeInterval = 10 * 60
    @State private var btimerActive = false
    @EnvironmentObject var stime: sTime
    @State private var bretimer: Timer?
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            ZStack {
                Color.breakTime.ignoresSafeArea()
                VStack {
                    Text("休憩中")
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
                        .foregroundStyle(Color.black)
                        .frame(maxWidth: 300, alignment: .leading)
                        .bold()
                    Text("\(formatTime(remainingBreakTime))")
                        .font(.system(size: 100, weight: .bold, design: .rounded))
                        .foregroundStyle(Color.black)
                    Spacer()
                    HStack {
                        Button {
                            btimerActive.toggle()
                            if btimerActive {
                                startTimer()
                            }else {
                                bretimer?.invalidate()
                            }
                        }label: {
                            Text(btimerActive ? "一時停止":"再開")
                                .font(.title)
                                .foregroundStyle(Color.white)
                                .frame(width: 150, height: 70)
                                .background(Color.gray)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                        }
                        Button {
                            bretimer?.invalidate()
                            btimerActive = false
                            remainingBreakTime = stime.breakInterval
                            dismiss()
                            
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
                }
                .onDisappear {
                    btimerActive = false
                    bretimer?.invalidate()
                }
            }
            .onAppear {
                remainingBreakTime = stime.breakInterval
                startTimer()
            }
        }.environmentObject(sTime())
    }
    func startTimer() {
        btimerActive = true
        bretimer?.invalidate()
        bretimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if remainingBreakTime > 0 {
                remainingBreakTime -= 1
                
            } else {
                btimerActive = false
                bretimer?.invalidate()
                dismiss()
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
    BreakTimer().environmentObject(sTime())
}
