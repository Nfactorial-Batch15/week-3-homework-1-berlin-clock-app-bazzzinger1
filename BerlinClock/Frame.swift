//
//  Frame.swift
//  BerlinClock
//
//  Created by user3605 on 16.12.2021.
//

import SwiftUI

struct Frame: View {
    var width: Double
    var height: Double
    
    var body: some View {
        Rectangle()
            .frame(width: CGFloat(width), height: CGFloat(height))
            .cornerRadius(12.0)
            .foregroundColor(Color.white)
            .shadow(radius: 2.0)
    }
}
