import SpriteKit

class BeforeStartScence: SKScene {
    
    var systemTime: CFTimeInterval = 1.0
    let atlas = SKTextureAtlas(named: "Start")
    var bgTexture = SKTexture()
    
    override func didMove(to view: SKView) {
        
        configureUI()
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        self.systemTime = currentTime
        
      //  processAsteroidOutScreen()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let gameScene = GameScene(size: self.size)
        
//        self.view?.presentScene(gameScene, transition: .fade(withDuration: 1.0))
        let touch = touches.first
        
        if let location = touch?.location(in: self) {
                       let nodesArray = self.nodes(at: location)
                       
            if nodesArray.first?.name == "startBtn" {
                           
                print("START")
            }
        }
        
    }
}

extension BeforeStartScence {
    
  
    
    private func configureUI(){
        configureBG()
        
        
        
        
        
    }
    
    private func configureBG() {
        let scenceWidth = self.frame.width
        let scenceHeight = self.frame.height
        bgTexture = atlas.textureNamed("BG")
    
        let bg = SKSpriteNode(texture: bgTexture)
        
        bg.size = CGSize(width: scenceWidth, height: scenceHeight)
        
        bg.position = CGPoint(x:scenceWidth/2 , y: scenceHeight/2)
        bg.zPosition = .zero
        
        
        self.addChild(bg)
    }
    
}
