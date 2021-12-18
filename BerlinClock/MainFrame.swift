//
//  MainFrame.swift
//  BerlinClock
//
//  Created by user3605 on 16.12.2021.
//

import SwiftUI

struct MainFrame: View {
    @Binding var time: Date
    
    var body: some View {
        ZStack{
            Frame(width: 358.0, height: 312.0)
            VStack(spacing:16.0){
                Seconds(time: $time)
                Hours(time: $time)
                Minutes(time: $time)
                
            }
        }
    }
}


struct Seconds: View {
    @Binding var time: Date
    var seconds: Int {
        get {
            return Calendar.current.component(.second, from: time)
        }
    }
    
    var body: some View {
        if seconds % 2 == 0 {
            Circle()
                .frame(width:56.0, height: 56.0)
                .foregroundColor(Color.yellow)
                .opacity(0.5)
        } else {
            Circle()
                .frame(width:56.0, height: 56.0)
                .foregroundColor(Color.yellow)
        }
    }
}

struct Hours: View {
    @Binding var time: Date
    
    var hours: Int {
        get {
            return Calendar.current.component(.hour, from: time)
        }
    }
    
    var body: some View {
        
        VStack(spacing:16.0){
            
            HStack(spacing:10.0){
                ForEach((1...4), id: \.self) {index in
                    if index <= hours/5 {
                        BigBrick()
                            .foregroundColor(Color.red)
                    } else {
                        BigBrick()
                            .foregroundColor(Color.red)
                            .opacity(0.5)
                    }
                }
            }
            
            HStack(spacing:10.0){
                ForEach((1...4), id: \.self) {index in
                    if index <= hours%5 {
                        BigBrick()
                            .foregroundColor(Color.red)
                    } else {
                        BigBrick()
                            .foregroundColor(Color.red)
                            .opacity(0.5)
                    }
                }
            }
            
        }
    }
}

struct Minutes: View {
    @Binding var time: Date
    
    var minutes: Int {
        get {
            return Calendar.current.component(.minute, from: time)
        }
    }
    
    var body: some View {
        
        VStack(spacing:16.0) {
            
            HStack(spacing:9.5){
                ForEach((1...11), id: \.self) { index in
                    
                    if index <= minutes/5 {
                        if index % 3 == 0 {
                            SmallBrick()
                                .foregroundColor(Color.red)
                        } else {
                            SmallBrick()
                                .foregroundColor(Color.yellow)
                        }
                    } else {
                        if index % 3 == 0 {
                            SmallBrick()
                                .foregroundColor(Color.red)
                                .opacity(0.5)
                        } else {
                            SmallBrick()
                                .foregroundColor(Color.yellow)
                                .opacity(0.5)
                        }
                    }
                }
            }.frame(width:326.0)
            
            HStack(spacing:10.0){
                ForEach((1...4), id: \.self) { index in
                    if index <= minutes % 5 {
                        BigBrick()
                            .foregroundColor(Color.yellow)
                    } else {
                        BigBrick()
                            .foregroundColor(Color.yellow)
                            .opacity(0.5)
                    }
                }
            }.frame(width:326.0)
            
        }
    }
}
