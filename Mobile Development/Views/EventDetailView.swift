//
//  EventDetailView.swift
//  Mobile Development
//
//  Created by user231764 on 1/6/23.
//

import Foundation
import SwiftUI

struct EventDetailView: View {
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
            
            // *** display the name of the activity ***
            Text(event.fields.activity).font(.largeTitle)
                .multilineTextAlignment(.center)
            
            // *** display time of event ***
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
        // *** change the look of the auto-generated "Back" button to adapt to our design
        }.navigationBackButton(color: .systemPink, text: "Go back to the planning")
        .onAppear {
            DispatchQueue.main.async {
                if (event.fields.speakers != nil) {
                    viewModel.fetchSpeakerByEvent(speakersId: event.fields.speakers ?? [])
                }
            }
        }
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(event: Event(id: "id", fields: Fields(activity: "Breakfast", type: "Meal", start: "2023-02-08T09:00:00.000Z", end: "2023-02-08T09:30:00.000Z", location: "President's dining hall", speakers: ["recMsLQRE21DymLru", "recS22dk8RoplL1pN"], notes: "Belinda's going to need a projector for her presentation")))
    }
}
