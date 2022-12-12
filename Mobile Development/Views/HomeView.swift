//
//  HomeView.swift
//  Mobile Development
//
//  Created by user231371 on 12/11/22.
//

import SwiftUI

struct HomeView: View {
    var viewModel = ViewModel()
    @State private var dayOne: String = "08T"
    
    var body: some View {
        VStack {
            Text("Titre Application")
            NavigationView() {
                List(viewModel.eventsArray, id: \.activity) { event in
                    if (event.start.contains(dayOne)) {
                        NavigationLink(destination: EventDetail(event: event)) {
                            EventRow(event: event)
                        }
                    }
                }
                .navigationTitle("Events")
                .toolbar {
                    Button("Day One") {
                        self.dayOne = "08T"
                    }
                    Button("Day Two") {
                        self.dayOne = "09T"
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
