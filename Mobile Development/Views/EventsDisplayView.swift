//
//  EventDisplayView.swift
//  Mobile Development
//
//  Created by user231747 on 1/6/23.
//

import SwiftUI

struct EventsDisplayView: View {
    @StateObject var viewModel = ViewModel()
    @State private var selectedDay = DayFilter.dayOne
    @State private var selectedType = TypeFilter.all
    @State private var selectedLocations = LocationFilter.all
    
    var body: some View {
        NavigationView() {
                            
            if viewModel.isError {
                ErrorView(errorDescription: viewModel.errorText)
            } else {
                List {
                    Section {
                        ForEach(self.filterEvent(), id: \.id) { event in
                            NavigationLink(destination: EventDetailView(event: event)) {
                                EventRowView(event: event)
                            }
                        }
                    }
                    footer: {
                        Text("\(self.filterEvent().count) events that day.")
                            .font(.subheadline)
                    }
                }
                
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        HStack {
                            Picker("", selection: $selectedDay.animation()) {
                                ForEach(DayFilter.allDays, id: \.self) { filter in
                                    Text(filter.rawValue)
                                }
                            }.pickerStyle(MenuPickerStyle())
                                .tint(.pink)
                            
                            Picker("", selection: $selectedType.animation()) {
                                ForEach(TypeFilter.allTypes, id: \.self) { filter in
                                    Text(filter.rawValue)
                                }
                            }.pickerStyle(MenuPickerStyle())
                                .tint(.pink)
                            
                            Spacer()
                            
                            Picker("", selection: $selectedLocations.animation()) {
                                ForEach(LocationFilter.allLocations, id: \.self) { filter in
                                    Text(filter.rawValue)
                                }
                            }.pickerStyle(MenuPickerStyle())
                                .tint(.pink)
                            
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchEventList()
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

struct EventsDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        EventsDisplayView()
    }
}
