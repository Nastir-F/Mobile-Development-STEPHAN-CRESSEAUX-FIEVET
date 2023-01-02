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
        VStack(spacing: 50) {
            Text("There was an error. (message à changer selon l'erreur)")
            Text(viewModel.errorText).font(.largeTitle)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
