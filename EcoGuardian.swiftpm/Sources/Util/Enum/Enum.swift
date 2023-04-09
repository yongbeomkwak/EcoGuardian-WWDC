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
    case howToPlay
    case game
    
    var buttonTitle:String {
        
        switch self {
            
        case .talk1:
            return "탄소가 많아지는게 안 좋은건가?"
        case .talk2:
            return "탄소가 왜 많이 생기는거지?"
        case .talk3:
            return "탄소를 없애는 방법은 없는건가??"
        case .talk4:
            return "좋은 방법이야 지구를 구하러가자!"
        case .howToPlay:
            return "오케이 확인했어"
        case .game:
            return ""
        }
        
    }
    
    
}

enum GameState {
    
    case playing,clear
    
}
