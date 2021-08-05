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
                        Text( model.currentLesson!.title )
                        
                        let url = URL(string: "https://codewithchris.github.io/learningJSON/\(model.currentLesson!.video)")
                    // Only show video if we get a valid URL
                    if url != nil {
                        VideoPlayer(player: AVPlayer(url: url!))
                            .cornerRadius(10)
                    }
                     
                    }
                }
                    .padding()
                    
                     
                
                
            
        
        
    
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
