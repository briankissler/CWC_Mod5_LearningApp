//
//  HomeViewRow.swift
//  LearningApp
//
//  Created by Brian Kissler on 8/2/21.
//

import SwiftUI

struct HomeViewRow: View {
    
    var image:String
    var category:String
    var description:String
    var count:String
    var time:String
    
    
    var body: some View {
        
        ZStack{
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
                //.frame(width: 335, height: 175, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            HStack{
                
                //image
                Image( image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                Spacer()
                
                
                //text
                VStack(alignment: .leading,spacing: 10){
                    //headline
                    Text(category)
                        .bold()
                    
                    //description
                    Text(description)
                        .padding(.bottom, 20)
                        .font(.caption)
                    
                    //Icons
                    HStack{
                        
                        // Number of lessons/questions
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15, height: 15)
                        
                        Text(count)
                            .font(.caption)
                        
                        
                        // Time
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                        
                        Text(time)
                            .font(.caption)
                        
                        
                    }
                    
                }
                
                
            }
            .padding(.horizontal, 20)
            
            
        }
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(image: "swift", category: "Learn Swift",description: "Some Desc", count: "10 Lessons", time: "2 Hours")
    }
}
