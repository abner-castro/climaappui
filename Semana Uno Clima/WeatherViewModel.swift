//
//  WeatherViewModel.swift
//  Semana Uno Clima
//
//  Created by Abner Castro on 19/01/23.
//

import Foundation

enum WheatherImage: String {
    case cold
    case mild
    case hot
}

struct WeatherViewModel {
    let temperatura: Int
    let city: String
    let history: [(String, String)]
    
    var description: String {
        switch temperatura {
        case 0...16:
            return "Clima frío"
        case 17...23:
            return "Clima templado"
        case 24...35:
            return "Clima caliente"
        default:
            return ""
        }
    }
    
    var imageType: WheatherImage {
        switch temperatura {
        case ...16:
            return .cold
        case 17...23:
            return .mild
        case 24...:
            return .hot
        default:
            return .cold
        }
    }
    
    
}
