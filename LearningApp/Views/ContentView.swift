//
//  ContentView.swift
//  LearningApp
//
//  Created by Brian Kissler on 8/3/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView{
            
            LazyVStack(alignment: .leading){
                
                if model.currentModule != nil {
                    
                    ForEach(model.currentModule!.content.lessons){ lesson in

                        ContentViewRow(lessonID: lesson.id, title: lesson.title, duration: lesson.duration)
                        
                        //
//                        ZStack(alignment: .leading){
//
//                            Rectangle()
//                                .foregroundColor(.white)
//                                .cornerRadius(10)
//                                .shadow(radius: 5)
//                                .frame(height: 70)
//
//                            HStack(spacing: 30 ){
//
//                                Text(String(lesson.id + 1))
//                                    .bold()
//
//
//
//                                VStack(alignment: .leading ) {
//
//                                    Text(lesson.title)
//                                        .padding(.bottom,5)
//
//                                    Text(lesson.duration)
//                                        .font(.caption)
//
//
//                                }.padding(.leading)
//
//
//
//                            }
//                            .padding()
//
//
//
//
//                        }
//                        .padding(.bottom, 10)
                        


                    }
                    
                }
                
                
            }
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
            
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ContentModel())
    }
}
