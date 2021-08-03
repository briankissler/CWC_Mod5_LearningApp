//
//  ContentView.swift
//  LearningApp
//
//  Created by Brian Kissler on 8/1/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView{
            
            LazyVStack{
                
                ForEach(model.Modules){ module in
                    
                    //learning card
                    
                    HomeViewRow(image: module.content.image, category: module.category, description: module.content.description, count: "\(module.content.lessons.count) Lessons ", time: module.content.time)
                    
                    
                    //test card
                    
                    HomeViewRow(image: module.test.image, category: "\(module.category) Test ", description: module.test.description, count:  "\(module.test.questions.count) Questions", time: module.test.time)
                    
                    
                }
                
            }
            .padding()
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ContentModel())
    }
}
