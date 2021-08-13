//
//  TestView.swift
//  LearningApp
//
//  Created by Brian Kissler on 8/12/21.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        VStack{
            
            if model.currentQuestion != nil {
             
                
                //Question #
                Text( String( model.currentQuestion!.id  ) )
                //Question
                Text(  model.currentQuestion!.content  )

                //Answers
                ForEach(model.currentQuestion!.answers, id: \.self) { ans in
                    
                    ZStack{
                        
                        RectangleCardView(myColor: Color.green)
                    
                        Button(action: { model.getNextQuestion() } , label: {
                            Text(ans)
                                .foregroundColor(.black)
                        })
                    }
                    
                    

                            }
                
                //Submit button
                
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
                
            }
            
        }.navigationTitle("\(model.currentModule?.category ?? "") Quiz")
    
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
