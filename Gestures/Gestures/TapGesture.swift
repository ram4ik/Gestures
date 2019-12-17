//
//  TapGesture.swift
//  Gestures
//
//  Created by ramil on 17.12.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct TapGesture: View {
    @State private var didTap: Bool = false
    var body: some View {
        VStack {
            Circle()
                .fill(didTap ? Color.blue : Color.red)
                .shadow(radius: didTap ? 30 : 0)
                .frame(width: 150, height: 150, alignment: .center)
                .onTapGesture(count: 2, perform: {
                    self.didTap.toggle()})
            
            Text("\(didTap ? "Double tapped" : "Tap the circle")")
        }
    }
}

struct TapGesture_Previews: PreviewProvider {
    static var previews: some View {
        TapGesture()
    }
}
