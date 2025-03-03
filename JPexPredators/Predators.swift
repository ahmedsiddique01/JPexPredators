//
//  Predators.swift
//  JPexPredators
//
//  Created by Ahmed Siddique on 23/02/2025.
//

import Foundation

class Predators {
    
    var allApexPredators:[ApexPredator] = []
    var apexPredators:[ApexPredator] = []
    
    init(){
        decodeApexPredatorData()
    }
    
    func decodeApexPredatorData(){
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do{
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allApexPredators = try decoder.decode([ApexPredator].self, from: data)
                apexPredators = allApexPredators
            }catch{
                print("Error decoding JSON data: \(error)")
            }
        }
    }
    
    func search(for searchText: String)-> [ApexPredator]{
        if searchText.isEmpty{
            return apexPredators
        }else{
            return apexPredators.filter{
                predator in
                predator.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    func sort(by alphabetical:Bool){
        apexPredators.sort{ predator1, predator2 in
            if alphabetical{
                return predator1.name < predator2.name
            }else{
                return predator1.id < predator2.id
            }
        }
    }
    
    func filter(by type:APType){
        if type == .all{
            apexPredators = allApexPredators
        }else{
            apexPredators = allApexPredators.filter{predator in
                predator.type == type
            }
        }
        
    }
}
