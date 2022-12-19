//
//  HomeView.swift
//  Mobile Development
//
//  Created by user231371 on 12/11/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = ViewModel()
    @State private var selectedDay = DayFilter.dayOne
    @State private var selectedType = TypeFilter.all
    @State private var selectedLocations = LocationFilter.all
    
    var body: some View {
        VStack {
            Text("Titre Application")  
            NavigationView() {
                List(self.filterEvent(), id: \.id) { event in
                    NavigationLink(destination: EventDetail(event: event)) {
                        EventRow(event: event)
                    }
                }
                .navigationTitle("Events")
                .toolbar {
                    // Voir si le .animation() rend bien selon CLOCLO
                    ToolbarItem(placement: .confirmationAction) {
                        Picker("", selection: $selectedDay/*.animation()*/) {
                            ForEach(DayFilter.allDays, id: \.self) { filter in
                                Text(filter.rawValue)
                            }
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Picker("", selection: $selectedType/*.animation()*/) {
                            ForEach(TypeFilter.allTypes, id: \.self) { filter in
                                Text(filter.rawValue)
                            }
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Picker("", selection: $selectedLocations/*.animation()*/) {
                            ForEach(LocationFilter.allLocations, id: \.self) { filter in
                                Text(filter.rawValue)
                            }
                        }
                    }
                }
                .onAppear {
                    viewModel.fetchEventList()
                }
            }
            Text("Footer")
        }
    }
    
    func filterEvent() -> [Event] {
        var displayEvents: [Event] = []
        // filter by day
        if (self.selectedDay == .dayOne) {
            displayEvents = viewModel.events.filter {
                $0.fields.start.contains("08T")
            }
        } else {
            displayEvents =  viewModel.events.filter {
                $0.fields.start.contains("09T")
            }
        }
        
        // filter by type
        if (self.selectedType != .all) {
            displayEvents = displayEvents.filter {
                $0.fields.type.contains(selectedType.rawValue)
            }
        }
        // filter by location
        if (self.selectedLocations != .all) {
            displayEvents = displayEvents.filter {
                $0.fields.location.contains(selectedLocations.rawValue)
            }
        }
        
        return displayEvents
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
