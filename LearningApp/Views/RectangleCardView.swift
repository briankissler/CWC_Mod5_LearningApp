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
    }
}

struct RectangleCardView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCardView(myColor: Color.blue)
    }
}
