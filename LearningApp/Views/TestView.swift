//
//  TestView.swift
//  LearningApp
//
//  Created by Brian Kissler on 8/12/21.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var selectedAnswer = -1
    @State var numberCorrect = 0
    @State var submitted = false
    //@State var myColor: [Color] = []
    
    @State var myColor2 = [Color.white,Color.white,Color.white,Color.white,Color.white,Color.gray]
    
    var body: some View {
        
        VStack{
            
            if model.currentQuestion != nil {
                
                
                //Question #
                Text("Question \( model.currentQuestionIndex+1) of \( model.currentModule!.test.questions.count )")
                //Question
                
                CodeTextView(type: "Question")
                
                //Answers
                ForEach(0..<model.currentQuestion!.answers.count, id: \.self) { index in
                    
                    Button(action: {
                            
                        selectedAnswer = index
                        
                        //myColor2[selectedAnswer] = Color.gray
                        
                         // selectedAnswer == index ? myColor2[5] : myColor2[index]
                    } , label: {
                        
                        ZStack{
                           
                            RectangleCardView(myColor: selectedAnswer == index ? myColor2[5] : myColor2[index])
                                
                            
                            Text(model.currentQuestion!.answers[index])
                                .foregroundColor(.black)
                        }.padding([.leading,.trailing], /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        
                        
                    }).disabled( submitted  )
                    
                }
                
                //Submit button
                
                Button(action: {
                    
                    if submitted {
                        
                        model.getNextQuestion()
                        selectedAnswer = -1
                        submitted = false
                        myColor2 = myColor2.map{_ in Color.white}
                        myColor2[5] = Color.gray
                    }
                    else {
                        
                        submitted = true
                        if selectedAnswer == model.currentQuestion!.correctIndex {
                            numberCorrect += 1
                            myColor2[5] = Color.green
                        }
                        else {
                            myColor2[model.currentQuestion!.correctIndex] = Color.red
                        }
                   // model.getNextQuestion()
                   // selectedAnswer = -1
                    }
                    
                    
                } , label: {
                    
                    ZStack{
                        
                        RectangleCardView(myColor: Color.green)
                        
                        Text(submitted ? "Next Question" : "Submit Answer")
                            .foregroundColor(.white)
                            .bold()
                    }.padding([.leading,.trailing], /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
                    
                }).disabled( selectedAnswer == -1  )
                
                
                
            }
            
        }.navigationTitle("\(model.currentModule?.category ?? "") Quiz")
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
