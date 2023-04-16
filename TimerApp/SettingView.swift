//
//  SettingView.swift
//  TimerApp
//
//  Created by 神　樹里乃 on 2023/04/16.
//

import SwiftUI

struct SettingView: View {
    @State private var timerValue: Int = 10
    
    var body: some View {
        VStack {
            Picker(selection: $timerValue) {
                Text("10")
                    .tag(10)
                Text("20")
                    .tag(20)
                Text("30")
                    .tag(30)
                Text("40")
                    .tag(40)
                Text("50")
                    .tag(50)
                Text("60")
                    .tag(60)
            } label: {
                Text("選択")
            }
            .pickerStyle(.wheel)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
