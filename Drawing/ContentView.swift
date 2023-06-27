//
//  ContentView.swift
//  Drawing
//
//  Created by Rob Ranf on 6/13/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Circle()
            .strokeBorder(.blue, lineWidth: 40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
