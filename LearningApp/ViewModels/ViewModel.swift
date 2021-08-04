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
            print( index )
            
            currentModuleIndex = index
            
            // set current module
             
        }
        
        currentModule = Modules[currentModuleIndex]
        
        
        
        
    }
    
    
    
    
    
}
