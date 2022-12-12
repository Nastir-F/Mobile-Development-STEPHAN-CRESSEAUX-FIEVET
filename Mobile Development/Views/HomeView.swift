//
//  HomeView.swift
//  Mobile Development
//
//  Created by user231371 on 12/11/22.
//

import SwiftUI

struct HomeView: View {
    var viewModel = ViewModel()
    @State private var dayOneNavigation: Bool = true
    
    var body: some View {
        VStack {
            Text("Titre Application")
            NavigationView() {
                List(viewModel.eventsArray, id: \.activity) { event in
                    if ((event.isDayOne && dayOneNavigation) || (!event.isDayOne && !dayOneNavigation) ) {
                        NavigationLink(destination: EventDetail(event: event)) {
                            EventRow(event: event)
                        }
                    }
                }
                .navigationTitle("Events")
                .toolbar {
                    Button("Day One") {
                        self.dayOneNavigation = true
                    }
                    Button("Day Two") {
                        self.dayOneNavigation = false
                    }
                }
                
            }
            Text("Footer")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
