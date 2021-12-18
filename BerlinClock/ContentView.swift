//
//  ContentView.swift
//  BerlinClock
//
//  Created by user3605 on 16.12.2021.
//

import SwiftUI

extension Date {
    func formatDate() -> String {
                    let dateFormatter = DateFormatter()
                dateFormatter.setLocalizedDateFormatFromTemplate("HH:mm:ss")
                return dateFormatter.string(from: self)
            }
}

struct ContentView: View {
    
    @State var date = Date()
    
    var body: some View {
        VStack(spacing: 10.0){
            TimeNow(date: $date)
            MainFrame(time: $date)
            datePicker(time: $date)
            Spacer()
        }
    }
}



struct TimeNow: View {
    @Binding var date: Date
    
    var body: some View {
        Text("Time is - \(date.formatDate())")
    }
}

struct datePicker: View {
    @Binding var time: Date
    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var isTimerRunning = true
    
    var body: some View {
        ZStack {
            Frame(width: 358.0, height: 54.0)
                .onTapGesture {
                    isTimerRunning = true
                }
            DatePicker("Insert time", selection: $time, displayedComponents: .hourAndMinute).environment(\.locale, Locale(identifier: "ru-RU"))
                .frame(width: 330.0, height: 46.0)
                .onReceive(timer) { input in
                    if isTimerRunning {time = input}
                }
                .onTapGesture {
                    isTimerRunning = false
                }
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

