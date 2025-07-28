//
//  StudyTimer.swift
//  トマトタイマー
//
//  Created by KOJI OSAKI on 2025/07/28.
//

import SwiftUI

struct StudyTimer: View {
    @State private var showBreakTimer = false
    
    var body: some View {
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
                    .bold()
                    
                Text("\(10):\(20)")
                    .font(.system(size: 100, weight: .bold, design: .rounded))
                Spacer()
                HStack {
                    Button {
                        
                    }label: {
                        Text("一時停止")
                            .font(.title)
                            .foregroundStyle(Color.white)
                            .frame(width: 150, height: 70)
                            .background(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            
                            
                    }
                    Button {
                        
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
            .sheet(isPresented: $showBreakTimer) {
                BreakTimer()
            }
        }
        
    }
}

#Preview {
    StudyTimer()
}
