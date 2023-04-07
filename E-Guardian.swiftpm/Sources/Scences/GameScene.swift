//
//  File.swift
//  
//
//  Created by yongbeomkwak on 2023/04/06.
//

import Foundation
import SpriteKit

class GameScene: SKScene, ObservableObject{

    var player = SKSpriteNode()
    
    
    override func didMove(to view: SKView) {
        
        self.size = CGSize(width: 600, height: 500)
        scene?.scaleMode = .aspectFill
        print("Game Start")
        
        fetchBackground(landName:"desrtLand")
        
    }
    
}

extension GameScene {
    
    
    func fetchBackground(landName:String) {
        
        let atlas = SKTextureAtlas(named: "BG")
        
        let landTexture = atlas.textureNamed(landName)
        
        let width = self.size.width
        let height = self.size.height
  
        let landWidth = landTexture.size().width
        let landRepeatNum = Int(ceil(width/landWidth))
        
        
        for i in 0...landRepeatNum{
           
            let land = SKSpriteNode(texture: landTexture)
            land.anchorPoint = .zero
            // 앵커포인트 : 어디를 기준으로 붙히냐
            // 0.5, 0.5 : 스프라이트의 중심을 기준으로
            // 0,0: 좌하단 기준
            // 1,1: 우상단 기준
            
            land.position = CGPoint(x: CGFloat(i)*landWidth, y: 25)
            land.zPosition = Layer.bg
            
            land.name = "land"
            land.physicsBody = SKPhysicsBody(rectangleOf: land.size,center: CGPoint(x: landWidth/2, y: land.size.height/2))
            
            land.physicsBody?.categoryBitMask = PhsicsCategory.land
            land.physicsBody?.affectedByGravity = false
            land.physicsBody?.isDynamic = false
            
            
            addChild(land)
            
            let moveLeft = SKAction.moveBy(x: -landWidth, y: 0, duration: 20)
            let moveReset = SKAction.moveBy(x: landWidth, y: 0, duration: 0)
            let moveSequence = SKAction.sequence([moveLeft,moveReset])
            
            land.run(SKAction.repeatForever(moveSequence))
                    
                    
            }
        
        
        
     
        
    }
    
    func createPlayer() {
        let atlas = SKTextureAtlas(named: "Bear")
        
        let width = self.size.width
        let height = self.size.height
        
        
        player = SKSpriteNode(texture: atlas.textureNamed("wark1"))
        

        
        
        
        self.addChild(player)
        
        
        
        
    }
    
    
}

