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
    private let dateFormatter = DateFormatter()
    private let timeFormatter = DateFormatter()
    
    init() {
        dateFormatter.dateFormat = "MM月dd日 E曜日"
        dateFormatter.locale = Locale(identifier: "ja_jp")
        timeFormatter.dateFormat = "HH:mm"
        timeFormatter.locale = Locale(identifier: "ja_jp")
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
                            
                            Text("23時間59分")
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
                                    
                                }label: {
                                    Text("25分")
                                        .font(.title)
                                        .foregroundStyle(Color.white)
                                        .frame(width: 150, height: 70)
                                        .background(Color.blue)
                                        .clipShape(RoundedRectangle(cornerRadius: 30))
                                        
                                        
                                }
                                Button {
                                    
                                }label: {
                                    Text("50分")
                                        .font(.title)
                                        .foregroundStyle(Color.white)
                                        .frame(width: 150, height: 70)
                                        .background(Color.blue)
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
}

#Preview {
    Home()
}
