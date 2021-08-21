//
//  TestResultView.swift
//  LearningApp
//
//  Created by Brian Kissler on 8/20/21.
//

import SwiftUI

struct TestResultView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var numCorrect:Int
    
    
    var resultHeading: String {
        
        guard model.currentModule != nil else {
            
            return ""
        }
        
        let pct = Double( numCorrect ) / Double( model.currentModule!.test.questions.count   )
        
        if pct > 0.5 {
            return "AWESOME"
        }
        else if pct > 0.2 {
            
            return "Doing Great"
            
        }
        else
        {
            return "Keep Learning"
            
        }
         
    }
    
    var body: some View {
        
        VStack{
            
            Text(resultHeading)
                .font(.title)
                .bold()
                .padding(.bottom, 200)
            
            Text("You got \(numCorrect) out of \(model.currentModule?.test.questions.count ?? 0 ) correct")
                .padding(.bottom, 200)
            
            
            Button(action: { model.selectedTestNavIndex = nil } , label: {
                
                ZStack{
                    
                    RectangleCardView(myColor: Color.green)
                        .padding()
                    
                    Text("Go Back")
                        .foregroundColor(.white)
                        .bold()
                
                     
                    
                    
                }
                
            })
            
               
        }
        
    }
}

struct TestResultView_Previews: PreviewProvider {
    @EnvironmentObject var model: ContentModel
    static var previews: some View {
        TestResultView(numCorrect: 1)
    }
}
