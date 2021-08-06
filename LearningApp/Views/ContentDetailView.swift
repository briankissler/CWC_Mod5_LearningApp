//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Brian Kissler on 8/3/21.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model:ContentModel
    
  
    
    var body: some View {
        
        
        VStack {
            
            
            if model.currentLesson != nil {
                
                let url = URL(string: "https://codewithchris.github.io/learningJSON/\(model.currentLesson!.video)")
                
                // Only show video if we get a valid URL
                if url != nil {
                    VideoPlayer(player: AVPlayer(url: url!))
                        .cornerRadius(10)
                }
                
                //description
                CodeTextView()
                //Text(model.currentLesson!.title)
                
                //button
                if model.isLastLesson() {
                    Button(action: { model.getNextLesson()  },
                           label: {
                            ZStack{
                                
                                Rectangle()
                                    .frame(height: 50)
                                    .foregroundColor(.green)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                
                               // Text(model.currentModule!.content.lessons[model.currentLessonIndex+1].title)
                                
                                Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex+1].title) ")
                                    .foregroundColor(.white)
                                    .bold()
                                
                            }
                            
                            
                           }
                           
                    )
                }
                
                
            }
        }
        .padding()
        .navigationTitle(model.currentLesson?.title ?? "")
        
        
        
        
        
        
        
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
