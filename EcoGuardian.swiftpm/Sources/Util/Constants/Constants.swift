//
//  File.swift
//
//
//  Created by yongbeomkwak on 2023/04/04.
//
import Foundation
import SpriteKit




struct PhysicsCategory {
    
    
    static let player:UInt32 = 0x1 << 0 // 1
    static let tree:UInt32 = 0x1 << 1 // 2
    static let blub:UInt32 = 0x1 << 2 // 4
    static let villian:UInt32 = 0x1 << 3 // 8
    static let land:UInt32 = 0x1 << 4
}

struct Layer {
    
    static let bg:CGFloat = 0
    
    static let land:CGFloat = 1
    
    static let player:CGFloat = 2
    
    static let item:CGFloat = 3
    
    static let zMax:CGFloat = 10
    
    
}

struct CustomFont {
    
    static let bold = "Pretendard-Bold"
    static let light = "Pretendard-Light"
    static let regular = "Pretendard-Regular"
    static let mine = "Minecrafter"
   
    
}




struct SoundFx {
    
    static let wing = SKAction.playSoundFileNamed("wing.mp3", waitForCompletion: false)
    
    static let cough = SKAction.playSoundFileNamed("cough.mp3", waitForCompletion: false)
    
    static let point = SKAction.playSoundFileNamed("point.mp3", waitForCompletion: false)
    
}

struct Message {
    
    let isImage:Bool
    let content:String
    
}

struct Conversation {
   
    
    static let villain1:[Message] = [Message(isImage: false, content: "Ha ha ha... I am Carbon Creeper and toxic cloud monster."),Message(isImage: false, content: "Every day the earth is getting warmer and warmer and make it perfect for"),Message(isImage: false, content: "Carbon monsters to live."),Message(isImage:false,content:"In 1958 carbon in the air was only 315 ppm but in 2020 it was increased to 419 ppm"),Message(isImage: false, content:"and the total carbon was increased by 33%"),Message(isImage: false, content: "")]
    
    static let you1:[Message] = [Message(isImage: false, content: "I am not sure why it is so bad if we have too much Carbon in the air?"),Message(isImage: false, content: ""),Message(isImage: false, content: ""),Message(isImage: false, content: ""),Message(isImage: false, content: "")]
    
    static let hero1:[Message] = [Message(isImage: false, content: "I am EcoBird and environmenatl protector"),Message(isImage: false, content: "Carborn is the main cause of the Greenhouse effect"),Message(isImage: false, content: "Greenhouse effect is Greenhouse gas wraps the earth like blanket and increase the earth's temperature"),Message(isImage: false, content: "Pictures above shows what happended the earth temperature gets increase and these are just few of example")]
    
    static let you2:[Message] = [Message(isImage: false, content:"What can we do to reduce carbon?"),Message(isImage: false, content: ""),Message(isImage: false, content: ""),Message(isImage: false, content: ""),Message(isImage: false, content: "")]
    
    static let hero2:[Message] = [Message(isImage: false, content: "if we can balance the carbon produce and absorb amount, the situation will not get worse."),Message(isImage: false, content: "One tree can absorb 48 pounds of Co2 annually"),Message(isImage: false, content: "And if we conserve energy/electricity, that has effect of planting 4.7 trees per year!"),Message(isImage: false, content: "Let's use the same concept for game content")]
    
    
    
    static let howtoPlay:[Item] = [
        
        Item(item: "speakBird", content: ["If you touch the screen, I can fly."]),
        
        Item(item: "100", content: ["This is the Carbon level display thermometer" ,"We need to make the 100% carbon to 0%"]),
       
        Item(item: "bulb", content: ["Each turned off light bulb I eat, it will reduce 20% of carbon"]),
        Item(item: "tree", content: ["Each tree I eat, it will reduce 10% of carbon"]),
        
        Item(item: "villain", content: ["Each carbon cloud I eat, it will increase 10% of carbon"])]


                                      
                                                            
    
     
}

struct Item {
    var item:String
    var content:[String]
}
