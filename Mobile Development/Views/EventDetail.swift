//
//  EventDetail.swift
//  Mobile Development
//
//  Created by user231371 on 12/11/22.
//

import SwiftUI

struct EventDetail: View {
    @StateObject var viewModel = ViewModel()
    let event: Event
    let dateFormatter: DateFormatter
    
    init(event: Event) {
        self.event = event
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    }
    
    var body: some View {
        VStack(spacing: 50) {
            
            Text(event.fields.activity).font(.largeTitle)
            
            // *** display time of event **
            HStack {
                Text(dateFormatter.date(from: String(event.fields.start.dropLast(5))) ?? Date(), style: .time).font(.title2)
                Text("-").font(.title2)
                Text(dateFormatter.date(from: String(event.fields.end.dropLast(5))) ?? Date(), style: .time).font(.title2)
            }
            
            // *** display activity and location ***
            Text("This " + event.fields.type + " event will be taking place in the " + event.fields.location + ".")

            // *** display speakers ***
            if (event.fields.speakers != nil) {
                Text("The speaker(s) at that event are: ").font(.title3)
                ForEach(viewModel.speakers, id: \.id) {
                    Text("\($0.fields.fullName)")
                }
            } else {
                Text("")
            }
            
            
        }
        .onAppear {
            if (event.fields.speakers != nil) {
                viewModel.fetchSpeakerByEvent(speakersId: event.fields.speakers ?? [])
            }
        }
    }
}

struct EventDetail_Previews: PreviewProvider {
    static var previews: some View {
        EventDetail(event: Event(id: "id", fields: Fields(activity: "Breakfast", type: "Meal", start: "2023-02-08T09:00:00.000Z", end: "2023-02-08T09:30:00.000Z", location: "President's dining hall", speakers: ["recMsLQRE21DymLru", "recS22dk8RoplL1pN"], notes: "Belinda's going to need a projector for her presentation")))
    }
}
