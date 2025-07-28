//
//  BreakTimer.swift
//  トマトタイマー
//
//  Created by KOJI OSAKI on 2025/07/28.
//

import SwiftUI

struct BreakTimer: View {
    var body: some View {
        ZStack {
            Color.breakTime
                .ignoresSafeArea()
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
            
        }
        
    }
}

#Preview {
    BreakTimer()
}
