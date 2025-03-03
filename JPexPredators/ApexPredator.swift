//
//  ApexPredator.swift
//  JPexPredators
//
//  Created by Ahmed Siddique on 23/02/2025.
//
import SwiftUI
import MapKit

struct ApexPredator: Decodable, Identifiable {
    let id:Int
    let name:String
    let type:APType
    let link:String
    let latitude:Double
    let longitude:Double
    let movieScenes:[MovieScene]
    
    struct MovieScene:Decodable,Identifiable{
        let id:Int
        let movie:String
        let sceneDescription:String
    }
    
    var image:String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    var location: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
}


enum APType:String, Decodable, CaseIterable, Identifiable{
    
    var id: APType {
        self
    }
    
    case all
    case land
    case air
    case sea
    
    var background:Color{
        switch self {
        
        case .land:
            return .brown
        case .air:
            return .teal
        case .sea:
            return .blue
        default:
            return .gray
        }
    }
    
    var icon:String{
        switch self {
            
        case .land:
            return "leaf.fill"
        case .air:
            return "wind"
        case .sea:
            return "drop.fill"
        case .all:
           return "square.stack.3d.up.fill"
        }
    }
}
