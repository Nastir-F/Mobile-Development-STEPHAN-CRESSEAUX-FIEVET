//
//  EventRow.swift
//  Mobile Development
//
//  Created by user231371 on 12/11/22.
//

import SwiftUI

struct EventRow: View {
    let event: Event
    
    var body: some View {
        HStack() {
            Image(event.type)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
            Text(event.activity)
                .font(.title2)
                .fontWeight(.bold)
            Text("debut - fin")
                .font(.title2)
        }
    }
}

struct EventRow_Previews: PreviewProvider {
    static var previews: some View {
        EventRow(event: Event(activity: "Breakfast", type: "Meal", start: "2023-02-08T09:00:00.000Z", end: "2023-02-08T09:30:00.000Z", location: "President's dining hall", speakers: [Speaker(firstName: "Belinda", lastName: "Chen"), Speaker(firstName: "Deepa", lastName: "Wartak")], notes: "Belinda's going to need a projector for her presentation"))
    }
}
