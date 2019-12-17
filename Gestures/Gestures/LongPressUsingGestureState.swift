//
//  LongPressUsingGestureState.swift
//  Gestures
//
//  Created by ramil on 17.12.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct LongPressUsingGestureState: View {
    @GestureState private var didLongPress: Bool = false
    var body: some View {
        Rectangle()
            .foregroundColor(Color.purple)
        .cornerRadius(40)
            .scaleEffect(didLongPress ? 1.2 : 1)
            .frame(width: 200, height: 200, alignment: .center)
            .gesture(LongPressGesture(minimumDuration: 1.0)
                .updating($didLongPress) { value, state, transaction in
                    state = value})
            .animation(.easeInOut)
    }
}

struct LongPressUsingGestureState_Previews: PreviewProvider {
    static var previews: some View {
        LongPressUsingGestureState()
    }
}
