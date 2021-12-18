//
//  Bricks.swift
//  BerlinClock
//
//  Created by user3605 on 16.12.2021.
//

import SwiftUI


struct BigBrick: View {
    var body: some View {
        Rectangle()
            .frame(width: 74.0, height: 32.0)
            .cornerRadius(4.0)
            
    }
}

struct SmallBrick: View {
    var body: some View {
        Rectangle()
            .frame(width:21.0, height: 32.0)
            .cornerRadius(2.0)
            
    }
}
