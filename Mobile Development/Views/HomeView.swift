//
//  HomeView.swift
//  Mobile Development
//
//  Created by user231371 on 12/11/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = ViewModel()
    @State private var dayOne: Bool = true
    
    var body: some View {
        VStack {
            Text("Titre Application")  
            NavigationView() {
                List(viewModel.events, id: \.id) { event in
                    if (dayOne) {
                        if (event.fields.start.contains("08T")) {
                            NavigationLink(destination: EventDetail(event: event)) {
                                EventRow(event: event)
                            }
                        }
                    } else {
                        if (event.fields.start.contains("09T")) {
                            NavigationLink(destination: EventDetail(event: event)) {
                                EventRow(event: event)
                            }
                        }
                    }
                    
                }
                .navigationTitle("Events")
                .toolbar {
                    Button("Day One") {
                        self.dayOne = true
                    }
                    Button("Day Two") {
                        self.dayOne = false
                    }
                }
                .onAppear {
                    viewModel.fetchEvent()
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
