//
//  EventRow.swift
//  Mobile Development
//
//  Created by user231371 on 12/11/22.
//

import SwiftUI

struct EventRow: View {
    let event: Event
    let dateFormatter: DateFormatter
    
    init(event: Event) {
        self.event = event
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    }
    
    var body: some View {
        HStack() {
            Image(event.type)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30)
            Text(event.activity)
                .fontWeight(.bold)
            HStack() {
                Text(dateFormatter.date(from: event.start) ?? Date(), style: .time)
                Text("-")
                Text(dateFormatter.date(from: event.end) ?? Date(), style: .time)
            }
        }
    }
}

struct EventRow_Previews: PreviewProvider {
    static var previews: some View {
        EventRow(event: Event(activity: "Breakfast", type: "Meal", start: "2023-02-08T09:00:00", end: "2023-02-08T09:30:00", location: "President's dining hall", speakers: [Speaker(firstName: "Belinda", lastName: "Chen"), Speaker(firstName: "Deepa", lastName: "Wartak")], notes: "Belinda's going to need a projector for her presentation"))
    }
}
