//
//  BuildATinderLikeSwipingGesture .swift
//  Gestures
//
//  Created by ramil on 17.12.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct BuildATinderLikeSwipingGesture_: View {
    
    @EnvironmentObject var observer : SwipeObserver
    
    var body : some View{
        
        GeometryReader{geo in
            
            ZStack{
                
                ForEach(self.observer.cards){card in
                    
                    
                    Rectangle()
                        .foregroundColor(card.color)
                        .cornerRadius(20)
                        .frame(width: geo.size.width-40, height: geo.size.height - 80, alignment: .center)
                        .gesture(DragGesture()
                            
                            .onChanged({ (value) in
                                
                                if value.translation.width > 0{
                                    
                                    if value.translation.width > 30{
                                        self.observer.update(id: card, value: value.translation.width, degree: 12)
                                    }
                                    else{
                                        self.observer.update(id: card, value: value.translation.width, degree: 0)
                                    }
                                }
                                else{
                                    
                                    if value.translation.width < -30{
                                        self.observer.update(id: card, value: value.translation.width, degree: -12)
                                    }
                                    else{
                                        self.observer.update(id: card, value: value.translation.width, degree: 0)
                                    }
                                }
                                
                            }).onEnded({ (value) in
                                
                                if card.drag > 0{
                                    
                                    if card.drag > geo.size.width / 2 - 40{
                                        self.observer.update(id: card, value: 500, degree: 0)
                                    }
                                    else{
                                        self.observer.update(id: card, value: 0, degree: 0)
                                    }
                                }
                                else{
                                    
                                    if -card.drag > geo.size.width / 2 - 40{
                                        self.observer.update(id: card, value: -500, degree: 0)
                                    }
                                    else{
                                        
                                        self.observer.update(id: card, value: 0, degree: 0)
                                    }
                                }
                                
                            })
                    ).offset(x: card.drag)
                        .scaleEffect(abs(card.drag) > 100 ? 0.8 : 1)
                        .rotationEffect(.init(degrees:card.degree))
                        .animation(.spring())
                    
                }
            }
        }
    }
}

struct BuildATinderLikeSwipingGesture__Previews: PreviewProvider {
    static var previews: some View {
        BuildATinderLikeSwipingGesture_()
    }
}

struct Cards : Identifiable {
    var id : Int
    var drag : CGFloat
    var degree : Double
    var color : Color
}

class SwipeObserver : ObservableObject{
    
    @Published var cards = [Cards]()
    
    init() {
        
        self.cards.append(Cards(id: 0, drag: 0, degree: 0, color: Color.purple))
        //Skipping for brevity
    }
    
    func update(id : Cards,value : CGFloat,degree : Double){
        
        for i in 0..<self.cards.count{
            
            if self.cards[i].id == id.id{
                
                self.cards[i].drag = value
                self.cards[i].degree = degree
            }
        }
    }
}
