//
//  ViewModel.swift
//  LearningApp
//
//  Created by Brian Kissler on 8/1/21.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var Modules = [Module]()
    
    //Current Module
    
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    
    @Published var currentLesson: Lesson?
    @Published var currentLessonIndex = 0
    
    //Current Lesson explaination
    @Published var lessonDescription = NSAttributedString()
    var StyleData: Data?
    
    @Published var selectedNavIndex: Int?
    
    init() {
        
        Modules.self = dataService.getLocalData()
        
        StyleData.self = dataService.getHTML()
        
        
    }
    
    //Mark: Module Navigation
    
    func beginModule(_ moduleid:Int){
        
        // find index for current id
        if let index = Modules.firstIndex(where: { $0.id == moduleid })
        {
            currentModuleIndex = index
        }
        currentModule = Modules[currentModuleIndex]
    }
    
    //Mark: Lesson Navigation
    
    func beginLesson(_ lessonid:Int){
        
        // find index for current id
        if let index = currentModule!.content.lessons.firstIndex(where: { $0.id == lessonid })
        {
            currentLessonIndex = index
        }
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        lessonDescription =  addStyling(currentLesson!.explanation)
    }
    
    func isLastLesson() -> Bool {
        
        return currentLessonIndex+1 < currentModule!.content.lessons.count
    }
    
    func getNextLesson()
    {
        if isLastLesson() {
            
            currentLesson = currentModule!.content.lessons[currentLessonIndex+1]
            lessonDescription =  addStyling(currentLesson!.explanation)
            
            currentLessonIndex += 1
            
        }
        else {
            currentLesson = currentModule!.content.lessons[0]
            lessonDescription =  addStyling(currentLesson!.explanation)
            
        }
        
        
    }
    
    //Mark: Code Styling
    
    private func addStyling(_ htmlstring: String ) -> NSAttributedString {
        
        var resultString = NSAttributedString()
        
        var data = Data()
        
               
        // Add Style Data
        if StyleData != nil {
            
            data.append( self.StyleData! )
            
        }
        // Add Html Data
        
        data.append( Data( htmlstring.utf8 ))
        
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil){
            
            resultString = attributedString
            
        }
        
        return resultString
        
    }
    
    
    
}
