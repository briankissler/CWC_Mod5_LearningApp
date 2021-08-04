//
//  ContentViewRow.swift
//  LearningApp
//
//  Created by Brian Kissler on 8/3/21.
//

import SwiftUI

struct ContentViewRow: View {
    
    @EnvironmentObject var model: ContentModel
    
    var lessonID:Int
    var title:String
    var duration:String
    
    var body: some View {
        
        ZStack(alignment: .leading){
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 70)
            
            HStack(spacing: 30 ){
                
                Text(String(lessonID + 1))
                    .bold()
                
                
                
                VStack(alignment: .leading ) {
                    
                    Text(title)
                        .padding(.bottom,5)
                    
                    Text(duration)
                        .font(.caption)
                    
                    
                }.padding(.leading)
                
                
                
            }
            .padding()
            
            
            
            
        }
        .padding(.bottom, 3)
        
        
    }
}

struct ContentViewRow_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewRow(lessonID: 0, title: "Constants", duration: "12 Min")
    }
}
