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

                        
                        NavigationLink(
                            destination: ContentDetailView()
                                .onAppear(perform: { model.beginLesson(lesson.id) } ),
                            label: {
                                
                                ContentViewRow(lessonID: lesson.id, title: lesson.title, duration: lesson.duration)
                                
                            })
                        

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
