//
//  HeaderView.swift
//  Mobile Development
//
//  Created by user231764 on 1/6/23.
//

import Foundation
import SwiftUI

struct HeaderView : View {
    @StateObject var viewModel = ViewModel()
    
    var body : some View {
        // *** header of the app ***
        Text("What we have planned for you :) ")
            .font(.headline)
            .frame(alignment: .leading)
    }
}
