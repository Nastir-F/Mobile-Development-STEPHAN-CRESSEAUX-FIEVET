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
        VStack {
            Text("Planning")
                .font(.system(size: 36))
                .foregroundColor(.pink)
                .frame(width: 300, height: 50, alignment: .center)
        }
    }
}
