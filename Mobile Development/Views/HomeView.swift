//
//  HomeView.swift
//  Mobile Development
//
//  Created by user231371 on 12/11/22.
//

import SwiftUI

struct HomeView: View {
    var viewModel = ViewModel()
    
    
    var body: some View {
        VStack {
            Text("Titre Application")
            NavigationView() {
                List(viewModel.eventsArray, id: \.activity) { event in
                    NavigationLink(destination: EventDetail(event: event)) {
                        EventRow(event: event)
                    }
                }
                .navigationTitle("Events")
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
