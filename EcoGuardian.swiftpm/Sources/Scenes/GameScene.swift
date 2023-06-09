//
//  File.swift
//
//
//  Created by yongbeomkwak on 2023/04/06.
//

import Foundation
import SpriteKit
import CoreMotion

final class GameScene: SKScene, ObservableObject{

    
    var player = SKSpriteNode()
    let cameraNode = SKCameraNode()
    var tempertureNode = SKSpriteNode()
    var bgmPlayer = SKAudioNode()
    var backgroundNode = SKSpriteNode()
    
    var timeLabel = SKLabelNode()
    var generateTimer1 = Timer()
    var generateTimer2 = Timer()
    var generateTimer3 = Timer()
    
    var touchesBegan = false
    var gameState = GameState.playing
    
    
    var time:Int = 0 {
        didSet {
            
            var sec = String(time / 100)
            
            var mil = String(time % 100)
            
            if sec.count < 2 {
               sec = "0" + sec
            }
            
            if mil.count < 2{
                mil = "0" + mil
            }
            
            timeLabel.text = "\(sec):\(mil)"
            
            
            
            
        }
    }
    
    
    
    let bgAtlas = SKTextureAtlas(named: "BG")
    let birdAtlas = SKTextureAtlas(named: "Bird")
    let itemAtlas = SKTextureAtlas(named: "Items")
    let tempertureAtlas = SKTextureAtlas(named: "temperture")
    let volume:Float = 0.5
    
    @Published var nBulb:Int = 0
    @Published var nTree:Int = 0
    @Published var carbonPercent:Int = 100
    @Published var isGameClear:Bool = false
    @Published var finshTime:Int = 0
    
    var prev:Int = 100
    var temperturePosition = CGPoint()
    
    override func didMove(to view: SKView) {
        
        
        
        self.size = CGSize(width: 600, height: 500)
        scene?.scaleMode = .aspectFill
        
        fetchBackground(landName:"desrtLand")
        
       // print(self.size)
        
        camera = cameraNode
        cameraNode.position.x = self.size.width / 2
        cameraNode.position.y = self.size.height / 2
        self.addChild(cameraNode)
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        self.physicsWorld.contactDelegate = self // 앱안에서 일어나는 충돌을 게임씬이 관리함
        
        createPlayer()
        createTemperture()
        
        bgmPlayer = SKAudioNode(fileNamed: "bgm.mp3")
        bgmPlayer.run(SKAction.changeVolume(to: volume, duration: 0))
        bgmPlayer.autoplayLooped = true
        self.addChild(bgmPlayer)
        
        generateTimer1 = .scheduledTimer(timeInterval: 4, target: self, selector: #selector(makeTree), userInfo: nil, repeats: true)
        
        generateTimer2 = .scheduledTimer(timeInterval: 6, target: self, selector: #selector(makeBulb), userInfo: nil, repeats: true)
        
        generateTimer3 = .scheduledTimer(timeInterval: 3, target: self, selector: #selector(makeVillain), userInfo: nil, repeats: true)
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
      
        self.player.zRotation = .zero

        if player.position.y > size.height - 60  {
            player.position.y = size.height - 60
        }
        
        if player.position.x != size.width / 2 {
            player.position.x = size.width / 2
        }
        
        
        
        if prev != carbonPercent {
            let texture = tempertureAtlas.textureNamed("\(carbonPercent)")
            tempertureNode.removeFromParent()
            tempertureNode = SKSpriteNode(texture: texture)
            
            tempertureNode.position = temperturePosition
            tempertureNode.setScale(0.5)
            
            addChild(tempertureNode)
            prev = carbonPercent
        }
        
        if carbonPercent == .zero {
            gameClear()
        }
        
        
       
      
      

    }
    
}

extension GameScene {
    

    
    
    func fetchBackground(landName:String) {
        
        
        
        let landTexture = bgAtlas.textureNamed(landName)
        let bgTexture = bgAtlas.textureNamed("factory")
        
        
        let width = self.size.width
        let height = self.size.height
  
        let landWidth = landTexture.size().width
        let landRepeatNum = Int(ceil(width/landWidth))
        
        let bgWidth = bgTexture.size().width
        let bgRepeatNum = Int(ceil(width/bgWidth))
        
       
        for i in 0...landRepeatNum{
           
            let land = SKSpriteNode(texture: landTexture)
            land.anchorPoint = .zero
            // 앵커포인트 : 어디를 기준으로 붙히냐
            // 0.5, 0.5 : 스프라이트의 중심을 기준으로
            // 0,0: 좌하단 기준
            // 1,1: 우상단 기준
            
            land.position = CGPoint(x: CGFloat(i)*landWidth, y: 25)
            land.zPosition = Layer.land
            
            land.name = "land"
            land.physicsBody = SKPhysicsBody(rectangleOf: land.size,center: CGPoint(x: landWidth/2, y: land.size.height/2))
            
            land.physicsBody?.categoryBitMask = PhysicsCategory.land
            land.physicsBody?.affectedByGravity = false
            land.physicsBody?.isDynamic = false
            
            
            addChild(land)
            
            let moveLeft = SKAction.moveBy(x: -landWidth, y: 0, duration: 20)
            let moveReset = SKAction.moveBy(x: landWidth, y: 0, duration: 0)
            let moveSequence = SKAction.sequence([moveLeft,moveReset])
            
            land.run(SKAction.repeatForever(moveSequence))
                    
                    
            }
        
        for i in 0...bgRepeatNum {
            backgroundNode = SKSpriteNode(texture: bgTexture)
            
            backgroundNode.position = CGPoint(x: CGFloat(i)*bgWidth, y: height/1.6)
            backgroundNode.zPosition = Layer.bg
            
            
            
            addChild(backgroundNode)
            
            let moveLeft = SKAction.moveBy(x: -landWidth, y: 0, duration: 20)
            let moveReset = SKAction.moveBy(x: landWidth, y: 0, duration: 0)
            let moveSequence = SKAction.sequence([moveLeft,moveReset])
            
            backgroundNode.run(SKAction.repeatForever(moveSequence))
            
            
        }
        
        
     
        
    }
    
    func createTemperture() {
        
        let texture = tempertureAtlas.textureNamed("100")
        tempertureNode = SKSpriteNode(texture: texture)
        temperturePosition = CGPoint(x: texture.size().width/2, y: self.size.height - texture.size().height/2 - 30)
        
        tempertureNode.position = temperturePosition
        tempertureNode.setScale(0.5)
        
    
        
        tempertureNode.zPosition = Layer.zMax
        addChild(tempertureNode)
    }
    
    func createPlayer() {
        
        
        let width = self.size.width
        let height = self.size.height
    
        let landTexture = bgAtlas.textureNamed("desertLand")
        
        
        
        player = SKSpriteNode(texture:birdAtlas.textureNamed("bird1"))
        player.position = CGPoint(x:self.size.width/2 , y: self.size.height/2)
        player.zPosition = Layer.player
        player.zRotation = .zero
        
        player.physicsBody = SKPhysicsBody(circleOfRadius: player.size.height/2)
        player.physicsBody?.categoryBitMask = PhysicsCategory.player
        
        player.physicsBody?.contactTestBitMask = PhysicsCategory.land | PhysicsCategory.tree | PhysicsCategory.blub | PhysicsCategory.villian
        player.physicsBody?.isDynamic = true
        player.physicsBody?.affectedByGravity = true
        
//        player.setScale(0.5)
        
        self.addChild(player)
        var animation = [SKTexture]()
        
        for i in 1...birdAtlas.textureNames.count {
            animation.append(SKTexture(imageNamed: "bird\(i)"))
        }
        
        let walkAnimation = SKAction.animate(with:animation,timePerFrame: 0.2)
        player.run(.repeatForever(walkAnimation))
        
        
        
        
        
        
        
        
    }
    
    @objc func makeTree() {
        
        let treeTexture = itemAtlas.textureNamed("tree")
        
        let tree = SKSpriteNode(texture: treeTexture)
        
        let lowLimit  = bgAtlas.textureNamed("land").size().height + 20
        let highLimit = self.size.height - treeTexture.size().height/2
        
        
        tree.position = CGPoint(x: Int(self.size.width + tree.size.width), y: Int.random(in: Int(lowLimit)...Int(highLimit)))
        tree.zPosition = Layer.item
        tree.name = "tree"
        tree.physicsBody = SKPhysicsBody(rectangleOf: tree.size)
        tree.physicsBody?.isDynamic = false
        tree.physicsBody?.affectedByGravity = false
        tree.physicsBody?.categoryBitMask = PhysicsCategory.tree
        
        tree.setScale(0.7)
        
        addChild(tree)
        
        
        let moveAction = SKAction.moveTo(x: -tree.size.width, duration: 10)
        let removeAction = SKAction.removeFromParent()
                
        let actions = SKAction.sequence([moveAction,removeAction])
        
        tree.run(actions)
        
        
    }
    
    @objc func makeBulb() {
        
        
        
        let bulbTexture = itemAtlas.textureNamed("bulb")
        
        
        let bulb = SKSpriteNode(texture: bulbTexture)
        
        let lowLimit  = bgAtlas.textureNamed("land").size().height + 50
        let highLimit = self.size.height - bulbTexture.size().height/2
        
        
        bulb.position = CGPoint(x: Int(self.size.width + bulb.size.width), y: Int.random(in: Int(lowLimit)...Int(highLimit)))
        bulb.zPosition = Layer.item
        bulb.name = "bulb"
        bulb.physicsBody = SKPhysicsBody(rectangleOf: bulb.size)
        bulb.physicsBody?.isDynamic = false
        bulb.physicsBody?.affectedByGravity = false
        bulb.physicsBody?.categoryBitMask = PhysicsCategory.blub
        
        bulb.setScale(0.7)
        
        addChild(bulb)
        
        
        let moveAction = SKAction.moveTo(x: -bulb.size.width, duration: 10)
        let removeAction = SKAction.removeFromParent()
                
        let actions = SKAction.sequence([moveAction,removeAction])
        
        bulb.run(actions)
        
        
    }
    
    @objc func makeVillain() {
        
        
        
        let villainTexture = SKTexture(imageNamed: "villain")
        
        let villain = SKSpriteNode(texture: villainTexture)
        
        let lowLimit  = bgAtlas.textureNamed("land").size().height + 50
        let highLimit = self.size.height - villainTexture.size().height/2
        
        
        villain.position = CGPoint(x: Int(self.size.width + villain.size.width), y: Int.random(in: Int(lowLimit)...Int(highLimit)))
        villain.zPosition = Layer.item
        villain.name = "villain"
        villain.physicsBody = SKPhysicsBody(rectangleOf: villain.size)
        villain.physicsBody?.isDynamic = false
        villain.physicsBody?.affectedByGravity = false
        villain.physicsBody?.categoryBitMask = PhysicsCategory.villian
        villain.setScale(0.3)
        
        addChild(villain)
        
        
        let moveAction = SKAction.moveTo(x: -villain.size.width, duration: 10)
        let removeAction = SKAction.removeFromParent()
                
        let actions = SKAction.sequence([moveAction,removeAction])
        
        villain.run(actions)
        
        
    }
    
    
    
    
}

extension GameScene {
    
    func damageEffect(){
           let flashNode = SKSpriteNode(color: UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), size: self.size)
           
           let actionSequence = SKAction.sequence([SKAction.wait(forDuration: 0.01),SKAction.removeFromParent()])
           
           flashNode.name = "flashNode"
           flashNode.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
           flashNode.zPosition = Layer.zMax
           addChild(flashNode)
           flashNode.run(actionSequence)
        
           
           let wait = SKAction.wait(forDuration: 1)
          // let soundSequence = SKAction.sequence([SoundFX.hit,wait,SoundFX.die])
           
          // run(soundSequence)
           
       }
       
       func cameraShake(){
           let moveLeft = SKAction.moveTo(x: self.size.width/2 - 5, duration: 0.1)
           let moveRight = SKAction.moveTo(x: self.size.width/2 + 5, duration: 0.1)
           let moveReset = SKAction.moveTo(x: self.size.width/2 , duration: 0.1)
           let shakeAction = SKAction.sequence([moveLeft,moveRight,moveLeft,moveRight,moveReset])
           shakeAction.timingMode = .easeInEaseOut
           self.cameraNode.run(shakeAction)
       }
    
    func collideObject(object:SKSpriteNode)
    {
        
        object.removeFromParent()
    }
    
    func gameClear(){
        generateTimer1.invalidate()
        generateTimer2.invalidate()
        generateTimer3.invalidate()
        player.removeFromParent()
        self.bgmPlayer.run(.stop())
        finshTime = time
        isGameClear = true
    }
    
}

extension GameScene: SKPhysicsContactDelegate {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if gameState == .playing {
            self.player.physicsBody?.velocity = CGVector(dx: 0, dy: 0) // 속도 리셋
            self.player.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 20))
            
            
            self.run(SoundFx.wing)
        }
        
        
        
    
        
    }

    func didBegin(_ contact: SKPhysicsContact) {
        var  collideBody = SKPhysicsBody()
                
        if contact.bodyB.categoryBitMask != PhysicsCategory.player && contact.bodyA.categoryBitMask != PhysicsCategory.player {
            return
        }
                
                //비트마스크 작은 플레이어
                if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
                    collideBody = contact.bodyB
                    
                } else {
                    
                    collideBody = contact.bodyA
                }
                
            
        
                
            let collideType = collideBody.categoryBitMask
                
                
        
        if collideType == PhysicsCategory.land {
            return
        }
        
                switch collideType {
                    
                case PhysicsCategory.tree:
                    
                    self.carbonPercent -= 10
                    nTree += 1
                    self.run(SoundFx.point)
                
                case PhysicsCategory.blub:
                    self.carbonPercent -= 30
                    nBulb += 1
                    self.run(SoundFx.point)
                    
                case PhysicsCategory.villian:
                    self.carbonPercent += 10
                    cameraShake()
                    self.run(SoundFx.cough)
                
                    
                default:
                    print("DEFAULT")
                    break
                    
                    
                }
        
        
        if let object = collideBody.node as? SKSpriteNode {
            collideObject(object: object)
        }
        
        
        
            
        self.carbonPercent  = self.carbonPercent > 100 ? 100 :self.carbonPercent
            self.carbonPercent  = self.carbonPercent < 0 ? 0 :self.carbonPercent
        
       
    }

}

