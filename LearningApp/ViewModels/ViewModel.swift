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
    
    //Current Question
    @Published var currentQuestion: Questions?
    @Published var questionDescription = NSAttributedString()
    var currentQuestionIndex = 0
    
    @Published var selectedNavIndex: Int?
    @Published var selectedTestNavIndex: Int?
    
    init() {
        
        DispatchQueue.main.async{
            
            self.Modules = dataService.getLocalData()
            
        }
        //Modules.self += dataService.getLocalData2()
        
       // getRemoteData2()
        
        // Append Remote

        dataService.getRemoteData( Completion: {myModel, error in
            
            if let myModel=myModel {
                DispatchQueue.main.async {
                    
                    self.Modules += myModel
                }

            }

        })
        
        //Modules.self += dataService.getRemoteData()
        
        StyleData.self = dataService.getHTML()
        
        
    }
    
    func getRemoteData2() {
        
        let urlString = "https://briankissler.github.io/MyData/data2.json"
        
        let url = URL(string: urlString )
        
        guard url != nil else {
            return
        }
        
        let request = URLRequest(url: url!)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
        
            guard error == nil else {
                return
            }
            
            
            do {
               
                let decoder = JSONDecoder()
                
                let modules = try decoder.decode([Module].self, from: data!)

                
                DispatchQueue.main.async {
                    self.Modules += modules
                }
                
            }
            
            catch{
                //print( error )
                print(error.localizedDescription)
            }
            
        }
        
        dataTask.resume()

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
    
    func beginTestQuestion(_ moduleid:Int){
        
        beginModule(moduleid)
        
        //lessonDescription =  addStyling(currentLesson!.explanation)
        
        if currentModule!.test.questions.count > 0 {
            
            currentQuestion = currentModule!.test.questions[currentQuestionIndex]
            questionDescription = addStyling(currentQuestion!.content)
            
        }
        
        
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
   
    func isLastQuestion() -> Bool {
        
        return currentQuestionIndex+1 < currentModule!.test.questions.count
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
    
    func getNextQuestion () {
        
        if isLastQuestion() {
            
            currentQuestion = currentModule!.test.questions[currentQuestionIndex+1]
            questionDescription = addStyling(currentQuestion!.content)
            currentQuestionIndex += 1
        }
        else{
            
            currentQuestion = currentModule!.test.questions[0]
            
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
