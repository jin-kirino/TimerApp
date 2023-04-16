//
//  ContentView.swift
//  TimerApp
//
//  Created by 神　樹里乃 on 2023/04/16.
//

import SwiftUI

struct ContentView: View {
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
