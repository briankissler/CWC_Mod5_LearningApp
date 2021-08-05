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
    
    
    var StyleData: Data?
    
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
    }
    
    func isLastLesson() -> Bool {
        
        return currentLessonIndex+1 < currentModule!.content.lessons.count
    }
    
    func getNextLesson()
    {
        if isLastLesson() {
            
            currentLesson = currentModule!.content.lessons[currentLessonIndex+1]
            currentLessonIndex += 1
            
        }
        else {
            currentLesson = currentModule!.content.lessons[0]
            
        }
        
        
    }
    
    
    
}
