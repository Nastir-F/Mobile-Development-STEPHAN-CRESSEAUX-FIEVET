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
                HeaderView()
                
                // *** body of the app ***
                EventsDisplayView()
            
                // *** footer of the app ***
                FooterView()
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

