//
//  CardView.swift
//  HeroAnimation
//
//  Created by Juan Camilo Marín Ochoa on 24/09/22.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        Image("imagen")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
