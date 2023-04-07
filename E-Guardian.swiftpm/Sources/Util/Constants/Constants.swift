//
//  File.swift
//
//
//  Created by yongbeomkwak on 2023/04/04.
//
import Foundation



struct PhsicsCategory {
    
    static let player:UInt32 = 0x1 << 0
    static let land:UInt32 = 0x1 << 1
    
}

struct Layer {
    
    static let bg:CGFloat = 0
    
    static let zMax:CGFloat = 10
    
}

struct CustomFont {
    
    static let jbmBold = "JetBrainsMono-Bold"
   
    
}


struct Character {
    
    static let heroName = "Eco Bear"
    static let villainName = "Carbon Creeper"
    
}


struct Conversation {
    
    static let villain1:[String] = ["오늘도 지구는 우리 탄소들이 살기 좋게 따뜻해지고 있군.","아래 그래프를 봐","우리는 1958년도 315ppm 에서 202년도 419ppm인 33% 증가 했어","이 속도는 더욱 가속될꺼야!"]

    
    static let hero1:[String] = ["더 이상 탄소들이 활게치게 간과할 수 없어","탄소들은 온실효과의 주 원인이야","온실효과는 온실가스가 담요처럼 지구를 덮어서 ,지구의 온도를 높이는 효과야","지구의 온도가 1도 오르면  육상생물 10% 멸종 위기","지구의 온도가 2도 오르면 ,해수면 7m 상승 , 북극 생물 40% 멸종 위기 에 봉착해"]

    
    static let villain2:[String] = ["인간들은 전기가 없으면 살 수 없지","전기 생산의 57%를 차지하는 화력발전은 우릴 더욱 많이 생산하지","한번 생긴 우리는 100년간 존재하지 누구도 우리를 막을 수 없어"]
    
    static let hero2:[String] = ["아니 우린할 수 있어","배출량과 흡수량이 균형을 이루면 더 이상 높아지지 않는다.","나무 한 그루 당 평균 48pounds의 이산화탄소를 흡수해","또한 대기전력을 뽑으면 나무를 년간 4.7그루에 나무를 심는 효과를 볼 수 있지!"]
    

    
    
    
    
}
