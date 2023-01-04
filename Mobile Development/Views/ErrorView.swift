//
//  ErrorView.swift
//  Mobile Development
//
//  Created by user231747 on 12/27/22.
//

import SwiftUI

struct ErrorView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment : .center) {
                Text(String(format: "There was an error.", 0))
                    .font(.largeTitle)
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
