//
//  ViewModel.swift
//  Mobile Development
//
//  Created by user231371 on 12/11/22.
//

import Foundation

class ViewModel : ObservableObject {
    var events: [Event] = [Event(id: "id", fields: Fields(activity: "Breakfast", type: "Meal", start: "2023-02-08T09:00:00.000Z", end: "2023-02-08T09:30:00.000Z", location: "President's dining hall", notes: "Belinda's going to need a projector for her presentation"))]
    
    func fetchEvent() {
        RequestFactory().getEventList { events in
            if let events = events {
                self.events = events.sorted {
                    $0.fields.start < $1.fields.start
                }
            }
        }
    }
}
