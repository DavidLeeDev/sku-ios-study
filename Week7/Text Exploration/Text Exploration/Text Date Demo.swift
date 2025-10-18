//
//  Text Date Demo.swift
//  Text Exploration
//
//  Created by 이승준 on 10/18/25.
//

import SwiftUI

struct Text_Date_Demo: View {
    let eventDate = Date(timeIntervalSinceNow: 15)
    let event = Date()
    let dateInterval = DateInterval(start: Date(), end: Date(timeIntervalSinceNow: 120))
    var body: some View {
        Form{
            Section("Intervals"){
                Text(Date.now...Date.now.addingTimeInterval(60))
                
                Text(dateInterval)
            }
            Section("Relative, offset and timer styles"){
                Text("Event will occur in \(eventDate, style: .relative)")
            }
            Text(Date.now...Date.now.addingTimeInterval(60)).font(.largeTitle)
            
            Text(dateInterval)
            
            Text("Event will occur in \(eventDate, style: .relative)")
            Text("Event will occur in \(eventDate, style: .offset)")
            Text("Event will occur in \(eventDate, style: .timer)")
            
            Text(Date(), format: .dateTime)
            Text(Date(), format: .dateTime.hour())
            Text(Date(), format: .dateTime.minute())
            Text(Date(), format: .dateTime.year())
            Text(Date(), format: .dateTime.hour().minute())
        }
    }
}

#Preview {
    Text_Date_Demo()
}
