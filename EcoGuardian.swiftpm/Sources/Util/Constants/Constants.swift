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

struct FontSize {
    
    static let conversation:CGFloat = UIScreen.height / 40
    
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
   
    
    static let villain1:[Message] = [Message(isImage: false, content: "Haw haw haw!!! I am the notorious Carbon Creeper, the toxic cloud monster!"),Message(isImage: false, content: "Every day the earth is getting warmer and warmer"),Message(isImage: false, content: "and that makes perfect for me to live!"),Message(isImage:false,content:"Back in 1958, the carbon in the air was only 315 ppm"),Message(isImage: false, content: "but now in the 2020s, it's increased to 419 ppm!"),Message(isImage: false, content:"That's 33% increase in total !!")]
    
    static let you1:[Message] = [Message(isImage: false, content: "Well, I'm not sure why it is so bad if we have too much carbon in the air."),Message(isImage: false, content: ""),Message(isImage: false, content: ""),Message(isImage: false, content: ""),Message(isImage: false, content: "")]
    
    static let hero1:[Message] = [Message(isImage: false, content: "I am EcoBird, the guardian of the earth!"),Message(isImage: false, content: "Carbon causes the Greenhouse effect."),Message(isImage: false, content: "Greenhouse effect is dangerous because the gas wrapping the earth like a blanket."),Message(isImage: false, content: "Pictures above show what happens if the earth's temperature goes up."),Message(isImage: false, content: "And you know what? These are only just a few of the downsides.")]
    
    static let you2:[Message] = [Message(isImage: false, content:"Oh my! Then what can we do to reduce carbon and save the Earth?"),Message(isImage: false, content: ""),Message(isImage: false, content: ""),Message(isImage: false, content: ""),Message(isImage: false, content: "")]
    
    static let hero2:[Message] = [Message(isImage: false, content: "We can make it better by reducing the carbon production"),Message(isImage: false, content: "and absorbing the carbon in the air!"),Message(isImage: false, content: "One tree can absorb 48 pounds of Co2 annually, and if we save energy"),Message(isImage: false, content: "that has an effect of planting 4.7 trees a year!"),Message(isImage: false, content: "That's also a hint for the game you'll play now!")]
    
    
    
    static let howtoPlay:[Item] = [
        
        Item(item: "speakBird", content: ["Touch the screen then I'll fly."]),
        
        Item(item: "100", content: ["This is the Carbon-thermometer","Let's take the carbon rate down from 100 to 0."]),
       
        Item(item: "bulb", content: ["When I crash on the turned off light bulb,","it will reduce 30% of the carbon"]),
        Item(item: "tree", content: ["When I catch and save the tree,","it will reduce 10% of the carbon"]),
        
        Item(item: "villain", content: ["When I eat the cloud,","it will increase 10% of the carbon"])]


                                      
                                                            
    
     
}

struct Item {
    var item:String
    var content:[String]
}
