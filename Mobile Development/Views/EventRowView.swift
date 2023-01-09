//
//  EventRowView.swift
//  Mobile Development
//
//  Created by user231764 on 1/6/23.
//

import Foundation
import SwiftUI

struct EventRowView: View {
    let event: Event
    let dateFormatter: DateFormatter
    
    let boxSize: CGFloat = 50
    
    init(event: Event) {
        self.event = event
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    }
    
    var body: some View {
        
        HStack {
            // *** image associated with the type of the event ***
            Image(event.fields.type)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40)
            
            // *** written info about the event, on 2 lines ***
            VStack(alignment: .leading) {
                
                // *** line one : name of the event ***
                Text(event.fields.activity)
                    .fontWeight(.bold)

                // ***  line two : at what time the event starts and at what time it stops ***
                HStack {
                    Text(dateFormatter.date(from: String(event.fields.start)) ?? Date(), style: .time)
                    Text("-")
                    Text(dateFormatter.date(from: String(event.fields.end)) ?? Date(), style: .time)
                }
            }.frame(alignment: .leading)
        }
    }
}

struct EventRowView_Previews: PreviewProvider {
    static var previews: some View {
        EventRowView(event: Event(id: "id", fields: Fields(activity: "Breakfast", type: "Meal", start: "2023-02-08T09:00:00.000Z", end: "2023-02-08T09:30:00.000Z", location: "President's dining hall", speakers: ["recMsLQRE21DymLru", "recS22dk8RoplL1pN"], notes: "Belinda's going to need a projector for her presentation")))
    }
}
