//
//  DataServices.swift
//  LearningApp
//
//  Created by Brian Kissler on 8/1/21.
//

import Foundation


class dataService {
    
    
    static func getHTML() -> Data?  {
        
        let styleURL = Bundle.main.url(forResource: "style", withExtension: "html")
        do {
            
            
            let styleData = try Data(contentsOf: styleURL!)
            
            return styleData
            
        }
        catch {
            
            print("Couldn't parse style data")
        }
        
        return (nil)
    }
    
    static func getLocalData() -> [Module] {
        
        var myError = ""
       
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {

            let url = URL(fileURLWithPath: path)

            do {

                myError = "DATA - "
                let data = try Data(contentsOf: url)

                let decoder = JSONDecoder()

                myError = "DECODE - "
                let getData = try decoder.decode([Module].self, from: data)

                return getData
            }
            catch
            {
                print(myError)
                print(error)
            }



        }
        else
        {
            return [Module]()
        }

        return [Module]()

    }
    
}
