//
//  File.swift
//
//
//  Created by yongbeomkwak on 2023/04/04.
//
import Foundation
import SpriteKit
import SwiftUI



struct PhysicsCategory {
    
    
    static let player:UInt32 = 0x1 << 0 // 1
    static let tree:UInt32 = 0x1 << 1 // 2
    static let blub:UInt32 = 0x1 << 2 // 4
    static let villian:UInt32 = 0x1 << 3 // 8
    static let land:UInt32 = 0x1 << 4
}

struct FontSize {
    
    static let conversation:CGFloat = UIScreen.height / 38
    static let gameDescription:CGFloat = UIScreen.height / 40
    static let mine:CGFloat = UIScreen.height / 35
    static let advice:CGFloat = UIScreen.height / 40
    
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
    
    let textColor:Color
    let content:String
    let isBold:Bool
}

struct Conversation {
   
    
    static let villain1:[Message] = [Message(textColor:.red, content: "Haw haw haw!!! I am the notorious Carbon Creeper, the toxic cloud monster!",isBold: true),Message(textColor:.white, content: "Every day the earth is getting warmer and warmer",isBold: false),Message(textColor:.white, content: "and that makes perfect for me to live!",isBold: false),Message(textColor:.white,content:"Back in 1958, the carbon in the air was only 315 ppm",isBold: false),Message(textColor:.white, content: "but now in the 2020s, it's increased to 419 ppm!",isBold: false),Message(textColor:.white, content:"That's 33% increase in total !!",isBold: false)]
    
    static let you1:[Message] = [Message(textColor:.white, content: "Well, I'm not sure why it is so bad if we have too much carbon in the air.",isBold: false),Message(textColor:.white, content: "",isBold: false),Message(textColor:.white, content: "",isBold: false),Message(textColor:.white, content: "",isBold: false),Message(textColor:.white, content: "",isBold: false),Message(textColor:.white, content: "", isBold: false),Message(textColor:.white, content: "",isBold: false)]
    
    static let hero1:[Message] = [Message(textColor:.green, content: "I am EcoBird, the guardian of the earth!",isBold: true),Message(textColor:.white, content: "Carbon causes the Greenhouse effect.",isBold: false),Message(textColor:.white, content: "Greenhouse effect is dangerous because the gas wrapping the earth like a blanket.",isBold: false),Message(textColor:.white, content: "Pictures above show what happens if the earth's temperature goes up.",isBold: false),Message(textColor:.white, content: "And you know what? These are only just a few of the downsides.",isBold: false)]
    
    static let you2:[Message] = [Message(textColor:.white, content:"Oh my! Then what can we do to reduce carbon and save the Earth?",isBold: false),Message(textColor:.white, content: "",isBold: false),Message(textColor:.white, content: "",isBold: false),Message(textColor:.white, content: "", isBold: false),Message(textColor:.white, content: "",isBold: false),Message(textColor:.white, content: "", isBold: false),Message(textColor:.white, content: "",isBold: false)]
    
    static let hero2:[Message] = [Message(textColor:.white, content: "We can make it better by reducing the carbon production",isBold: false),Message(textColor:.white, content: "and absorbing the carbon in the air!",isBold: false),Message(textColor:.green, content: "One tree can absorb 48 pounds of Co2 annually, and if we save energy",isBold: true),Message(textColor:.green, content: "that has an effect of planting 4.7 trees a year!",isBold: true),Message(textColor:.white, content: "That's also a hint for the game you'll play now!",isBold: false)]
    
    
    
    static let howtoPlay:[Item] = [
        
        Item(item: "speakBird", content: ["Tap the screen to fly."]),
        
        Item(item: "100", content: ["Check carbon levels with ","the Carbon-thermometer.","Bring carbon rate down to 0 from 100."]),
       
        Item(item: "bulb", content: ["Hitting turned-off light bulbs reduces ","30% of carbon"]),
        Item(item: "tree", content: ["Saving trees reduces 10% of carbon."]),
        
        Item(item: "villain", content: ["Cloud exposure raises carbon by 10%"])]


                                      
                                                            
    
     
}

struct Item {
    var item:String
    var content:[String]
}
