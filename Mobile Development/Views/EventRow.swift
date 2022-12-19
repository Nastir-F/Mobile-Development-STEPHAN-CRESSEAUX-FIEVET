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
            Image(event.fields.type)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30)
            Text(event.fields.activity)
                .fontWeight(.bold)
            HStack {
                // Drop .000Z for the format
                Text(dateFormatter.date(from: String(event.fields.start.dropLast(5))) ?? Date(), style: .time)
                Text("-")
                Text(dateFormatter.date(from: String(event.fields.end.dropLast(5))) ?? Date(), style: .time)
            }
        }
    }
}

struct EventRow_Previews: PreviewProvider {
    static var previews: some View {
        EventRow(event: Event(id: "id", fields: Fields(activity: "Breakfast", type: "Meal", start: "2023-02-08T09:00:00.000Z", end: "2023-02-08T09:30:00.000Z", location: "President's dining hall", speakers: ["recMsLQRE21DymLru", "recS22dk8RoplL1pN"], notes: "Belinda's going to need a projector for her presentation")))
    }
}
