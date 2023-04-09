//
//  File.swift
//  
//
//  Created by yongbeomkwak on 2023/04/08.
//

import Foundation
import SpriteKit



class IntroScene:SKScene{

    
    
            
    override func didMove(to view: SKView) {
            
            // MARK: - Configured Start Scene
        scene?.size = view.bounds.size
        scene?.scaleMode = .aspectFill
        
        randomGenerate()
        randomGenerate()
        randomGenerate()
        randomGenerate()
        randomGenerate()
        
        //self.backgroundColor    = .clear
            
        
    }
    
}

extension IntroScene {
    
    private func randomGenerate() {
            let cloudNode = SKSpriteNode(imageNamed: "villain")
        
            cloudNode.position = randomPosition()
            self.addChild(cloudNode)

        
        let ani:[SKAction] = [SKAction.move(to: randomDirection(), duration: 45),SKAction.removeFromParent()]
        
        
        cloudNode.run(.sequence(ani))
        
            
        }
    
    private func randomPosition() -> CGPoint {
        
        let width = Float(self.size.width)
        let height = Float(self.size.height)
        
        
        let x = Float.random(in: 0...width)
        let y = Float.random(in: 0...height)
        
        
        return CGPoint(x: CGFloat(x), y: CGFloat(y))
        
        
    }
    
    private func randomDirection() -> CGPoint {
        let marginX: Float = 50.0
        let marginY: Float = 50.0
                
        let randomX = Float.random(in: -marginX...(Float(self.frame.maxX) + marginX))
        
        let randomY = Float.random(in: -marginY...(Float(self.frame.maxY) + marginY))
                
        return CGPoint(x: CGFloat(randomX), y: CGFloat(randomY))
    }
    
    
}

