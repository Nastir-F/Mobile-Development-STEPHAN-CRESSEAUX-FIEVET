//
//  EventDetail.swift
//  Mobile Development
//
//  Created by user231371 on 12/11/22.
//

import SwiftUI

struct EventDetail: View {
    let event: Event
    
    var body: some View {
        VStack {
            Text("Todo : afficher le détail de l'event en mode cleeeean")
            Text("Regarder dans EventRow pour afficher la date")
            Text("Pas encore possible d'afficher les speakers")
        }
    }
}

struct EventDetail_Previews: PreviewProvider {
    static var previews: some View {
        EventDetail(event: Event(id: "id", fields: Fields(activity: "Breakfast", type: "Meal", start: "2023-02-08T09:00:00", end: "2023-02-08T09:30:00", location: "President's dining hall", notes: "Belinda's going to need a projector for her presentation")))
    }
}
