//
//  History.swift
//  トマトタイマー
//
//  Created by KOJI OSAKI on 2025/07/25.
//

import SwiftUI

struct History: View {
    var body: some View {
        ZStack {
            Image(.wall2)
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            VStack {
                Text("履歴")
                    .font(.title2)
                    .frame(width: 500, height:150)
                    .background(
                        Rectangle()
                        
                            .foregroundStyle(.ultraThinMaterial)
                            .frame(width: 500, height:100)
                            .ignoresSafeArea()
                    )
                    .ignoresSafeArea()
                Spacer()
            }
        }
    }
}

#Preview {
    History()
}
