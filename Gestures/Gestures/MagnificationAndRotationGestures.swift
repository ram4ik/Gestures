//
//  MagnificationAndRotationGestures.swift
//  Gestures
//
//  Created by ramil on 17.12.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct MagnificationAndRotationGestures: View {
    @State var magnificationValue: CGFloat = CGFloat(1)
    @State var rotationValue: Angle = .zero
    var body: some View {
        Rectangle()
            .foregroundColor(Color.purple)
            .cornerRadius(40)
            .scaleEffect(magnificationValue)
            .rotationEffect(rotationValue)
            .frame(width: 200, height: 200, alignment: .center)
            .gesture(MagnificationGesture()
                .onChanged { value in
                    self.magnificationValue = value
            }
            .simultaneously(with: RotationGesture().onChanged { value in
                self.rotationValue = value
            }))
    }
}

struct MagnificationAndRotationGestures_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationAndRotationGestures()
    }
}
