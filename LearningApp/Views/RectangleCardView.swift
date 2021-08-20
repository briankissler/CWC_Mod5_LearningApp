//
//  RectangleCardView.swift
//  LearningApp
//
//  Created by Brian Kissler on 8/7/21.
//

import SwiftUI

struct RectangleCardView: View {
    
    var myColor = Color.blue
    
    
    var body: some View {
        Rectangle()
            .frame(height: 50)
            .foregroundColor(myColor)
            .cornerRadius(10)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

struct RectangleCardView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCardView(myColor: Color.blue)
    }
}
