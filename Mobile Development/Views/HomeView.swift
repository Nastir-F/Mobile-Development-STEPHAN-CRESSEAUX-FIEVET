//
//  HomeView.swift
//  Mobile Development
//
//  Created by user231371 on 12/11/22.
//

import SwiftUI
import UIKit

struct HomeView: View {
    
    var body: some View {
            
            VStack {
            
                // *** header of the app ***
                Text("What we have planned for you :) ")
                    .font(.headline)
                    .frame(alignment: .leading)
                
                // *** body of the app ***
                
                EventsDisplayView()
            
            // *** footer of the app ***
            Text("Thank you for using our app !")
                .font(.subheadline)
        }
        Spacer()
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

