//
//  BackButtonVIewModifier.swift
//  Mobile Development
//
//  Created by user231371 on 1/9/23.
//

import Foundation
import SwiftUI

struct BackButtonViewModifier: ViewModifier {

    @Environment(\.presentationMode) var presentationMode
    var color: UIColor
    var text: String?

    // *** modification of the auto-generated "Back" button when viewing an EventDetail view ***
    func body(content: Content) -> some View {
        return content
            // *** hide the current button ***
            .navigationBarBackButtonHidden(true)
            // *** add our own, with our style
            .navigationBarItems(
                leading: Button(action: {  presentationMode.wrappedValue.dismiss() }, label: {
                    HStack(spacing: 2) {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(Color(color))

                        if let text = text {
                            Text(text)
                                .foregroundColor(Color(color))
                                .font(.system(size: 24))
                        }
                    }
                })
            )
    }
}

extension View {
    func navigationBackButton(color: UIColor, text: String? = nil) -> some View {
        modifier(BackButtonViewModifier(color: color, text: text))
    }
}
