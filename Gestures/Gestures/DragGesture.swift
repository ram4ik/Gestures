//
//  DragGesture.swift
//  Gestures
//
//  Created by ramil on 17.12.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct DragGesture: View {
    @State var dragOffset = CGSize.zero
    var body: some View {
        Rectangle()
            .foregroundColor(Color.purple)
        .cornerRadius(40)
            .animation(.spring())
            .offset(y: self.dragOffset.height)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
        
    }
}

struct DragGesture_Previews: PreviewProvider {
    static var previews: some View {
        DragGesture()
    }
}
