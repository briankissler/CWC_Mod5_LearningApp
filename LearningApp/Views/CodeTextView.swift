//
//  CodeTextView.swift
//  LearningApp
//
//  Created by Brian Kissler on 8/6/21.
//

import SwiftUI

struct CodeTextView: UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    
    
    func makeUIView(context: Self.Context) -> UITextView {
        
        let textView = UITextView()
        
        textView.isEditable = false
        
        return textView
        
    }
    
    func updateUIView(_ textView: UITextView, context: Self.Context)
    {
        
        // Set the attributed text for lesson
        
        textView.attributedText = model.lessonDescription
        //scroll to top
        
        textView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
        
    }
    
}

struct CodeTextView_Previews: PreviewProvider {
    static var previews: some View {
        CodeTextView()
    }
}
