//
//  History.swift
//  トマトタイマー
//
//  Created by KOJI OSAKI on 2025/07/25.
//

import SwiftUI

struct History: View {
    @EnvironmentObject var stime: sTime
    
    var body: some View {
        ZStack {
            Image(.wall2)
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            VStack {
                Text("統計")
                    .font(.title)
                    .background(
                        Rectangle()
                            .foregroundStyle(.ultraThinMaterial)
                            .frame(width: 500, height:100)
                            .ignoresSafeArea()
                        )
                    
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundStyle(.ultraThinMaterial)
                        .frame(width: 350, height: 180)
                        .shadow(color: .init(white: 0.4, opacity: 0.4), radius: 5, x: 0, y: 0)
                    VStack {
                        Text("今年の集中時間")
                            .multilineTextAlignment(.center)
                            .bold()
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                            
                            .frame(width: 300, height: 30, alignment: .leading)
                        
                        Text(formatTime(stime.yearly))
                            .multilineTextAlignment(.center)
                            .bold()
                            .font(.system(size: 50, weight: .bold, design: .rounded))
                            
                            .frame(width: 350, height: 80)
                    }
                    Spacer()
                    
                }
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundStyle(.ultraThinMaterial)
                        .frame(width: 350, height: 180)
                        .shadow(color: .init(white: 0.4, opacity: 0.4), radius: 5, x: 0, y: 0)
                    VStack {
                        Text("今月の集中時間")
                            .multilineTextAlignment(.center)
                            .bold()
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                            
                            .frame(width: 300, height: 30, alignment: .leading)
                        
                        Text(formatTime(stime.monthly))
                            .multilineTextAlignment(.center)
                            .bold()
                            .font(.system(size: 50, weight: .bold, design: .rounded))
                            
                            .frame(width: 350, height: 80)
                    }
                    Spacer()
                    
                }
                    .ignoresSafeArea()
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundStyle(.ultraThinMaterial)
                        .frame(width: 350, height: 180)
                        .shadow(color: .init(white: 0.4, opacity: 0.4), radius: 5, x: 0, y: 0)
                    VStack {
                        Text("今日の集中時間")
                            .multilineTextAlignment(.center)
                            .bold()
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                            
                            .frame(width: 300, height: 30, alignment: .leading)
                        
                        Text(formatTime(stime.today))
                            .multilineTextAlignment(.center)
                            .bold()
                            .font(.system(size: 50, weight: .bold, design: .rounded))
                            
                            .frame(width: 350, height: 80)
                    }
                    Spacer()
                    
                }.ignoresSafeArea()
                Spacer()
            }
        }
    }
    func formatTime(_ time: TimeInterval) -> String {
        let totalMinutes = Int(time) / 60
        let minutes = totalMinutes % 60
        let hours = totalMinutes / 60
        return String(format: "%02d時間%02d分",hours, minutes)
    }
    
}

#Preview {
    History().environmentObject(sTime())
}
