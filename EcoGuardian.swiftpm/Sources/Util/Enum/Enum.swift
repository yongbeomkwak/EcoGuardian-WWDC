//
//  File.swift
//
//
//  Created by yongbeomkwak on 2023/04/06.
//

import Foundation

enum Page:Int {
    
    case talk1
    case talk2
    case talk3
    case talk4
    case talk5
    case talk6
    case talk7
    case talk8
    case howToPlay
    case game

    
    
}

enum GameState {
    
    case playing,clear
    
}

enum Characteres {
    case hero,villian,you
    
    var name:String {
        
        switch self {
            
        case .hero:
            return "Eco Bird"
        case .villian:
            return "Carbon Creeper"
        case .you:
            return "you"
        }
        
    }
    
}
