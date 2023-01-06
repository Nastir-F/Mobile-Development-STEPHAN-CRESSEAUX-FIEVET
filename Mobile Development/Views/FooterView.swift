//
//  FooterView.swift
//  Mobile Development
//
//  Created by user231764 on 1/6/23.
//

import Foundation
import SwiftUI

struct FooterView : View {
    @StateObject var viewModel = ViewModel()
    
    var body : some View {
        Text("Thank you for using our app !")
            .font(.subheadline)
    }
}
