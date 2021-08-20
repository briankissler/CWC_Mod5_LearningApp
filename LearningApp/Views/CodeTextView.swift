//
//  CodeTextView.swift
//  LearningApp
//
//  Created by Brian Kissler on 8/6/21.
//

import SwiftUI

struct CodeTextView: UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    var type: String
    
    
    func makeUIView(context: Self.Context) -> UITextView {
        
        let textView = UITextView()
        
        textView.isEditable = false
        
        return textView
        
    }
    
    func updateUIView(_ textView: UITextView, context: Self.Context)
    {
        
        // Set the attributed text for lesson
        if type == "Lesson" {
            
            textView.attributedText = model.lessonDescription
        }
        else {
            textView.attributedText = model.questionDescription
            
        }
        //scroll to top
        
        textView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
        
    }
    
}

struct CodeTextView_Previews: PreviewProvider {
    
    @EnvironmentObject var model: ContentModel
    
    static var previews: some View {
        CodeTextView(type: "lesson")
    }
}
