//
//  SpecialEffectsView.swift
//  Drawing
//
//  Created by Rob Ranf on 6/27/23.
//

import SwiftUI

struct SpecialEffectsView: View {
    var body: some View {
        ZStack {
            Image("madison")
            
            Rectangle()
                .fill(.red)
                .blendMode(.multiply)
        }
        .frame(width: 400, height: 500)
        .clipped()
    }
}

struct SpecialEffectsView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialEffectsView()
    }
}
