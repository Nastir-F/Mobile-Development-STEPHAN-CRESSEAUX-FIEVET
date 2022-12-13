//
//  ViewModel.swift
//  Mobile Development
//
//  Created by user231371 on 12/11/22.
//

import Foundation

class ViewModel : ObservableObject {
    var events: [Event] = []
    
    func fetch() {
        RequestFactory().getEventList { events in
            if let events = events {
                self.events = events.sorted {
                    $0.fields.start < $1.fields.start
                }
            }
        }
    }
}
