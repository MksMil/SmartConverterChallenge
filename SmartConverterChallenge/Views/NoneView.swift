//
//  NoneView.swift
//  SmartConverterChallenge
//
//  Created by Миляев Максим on 31.05.2023.
//

import SwiftUI

struct NoneView: View {
    var body: some View {
        VStack {
            Image(systemName: "hand.point.up")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
                .offset(CGSize(width: 0, height: -50))
                .opacity(0.3)
            Text("Choose, what you want to convert")
                .font(.title2)
            .fontWeight(.ultraLight)
        }
        .offset(CGSize(width: 0, height: -80))
    }
}

struct NoneView_Previews: PreviewProvider {
    static var previews: some View {
        NoneView()
    }
}
