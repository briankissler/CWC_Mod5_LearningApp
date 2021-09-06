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
    
    
    static func getLocalData2() -> [Module] {
        
        var myError = ""
       
        if let path = Bundle.main.path(forResource: "data2", ofType: "json") {

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
    
    
    
    //func getRemoteData( completion: @escaping ( [Module]?) -> Void )  {
    static func getRemoteData(Completion: @escaping ([Module]?, Error?) -> Void) {

        let urlString =  "https://briankissler.github.io/MyData/data2.json"

        let url = URL(string: urlString)

        let session = URLSession.shared


        let Task = session.dataTask(with: url!, completionHandler: { data, response, error in

            guard let data = data else {
                return
            }
            //handle
            do {

                //myError = "DATA - "
                //let data = try Data(contentsOf: url)

                let decoder = JSONDecoder()

                //myError = "DECODE - "
                let getData = try decoder.decode([Module].self, from: data)

//                if let userData = jsonDict["data"] {
//                        userCompletionHandler(userData, nil)
                  //    }

                Completion(getData, nil)

            }
            catch
            {

            }


        })

        Task.resume()

        //return getData
    }

}
