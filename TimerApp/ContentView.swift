//
//  ContentView.swift
//  TimerApp
//
//  Created by 神　樹里乃 on 2023/04/16.
//

import SwiftUI

struct ContentView: View {
    @State var timerHandler: Timer?
    @State var count: Int = 0
    @AppStorage("timer_value") var timerValue = 10
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30.0) {
                Text("残り10秒")
                    .font(.largeTitle)
                HStack {
                    ButtonView(buttonLavel: "start")
                        .background(Color.red)
                        .clipShape(Circle())
                    ButtonView(buttonLavel: "stop")
                        .background(Color.blue)
                        .clipShape(Circle())
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingView()) {
                        Text("秒数設定")
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    // 1秒ごとカウントダウンする関数
    func countDownTimer() {
        count += 1
        if timerValue - count <= 0 {
            timerHandler?.invalidate()
        }
    }
    
    // カウントダウンをする条件を設定、当てはまったらcountdown()を実行
    func startTimer() {
        if let unwrapedTimerHandler = timerHandler {
            if unwrapedTimerHandler.isValid == true {
                return
            }
        }
        
        if timerValue - count <= 0 {
            count = 0
        }
        
        timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            countDownTimer()
        }
    }
}

struct ButtonView: View {
    @State var buttonLavel: String

    var body: some View {
        Text(buttonLavel)
            .font(.title)
            .foregroundColor(Color.white)
            .frame(width: 140, height: 140)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
