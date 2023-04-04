import SpriteKit

class BeforeStartScence: SKScene {
    
    var systemTime: CFTimeInterval = 1.0
  
    
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
        
        let scenceWidth = self.frame.width
        let scenceHeight = self.frame.height
        
        self.backgroundColor = .black
        
        let titleLabel = SKLabelNode()
        titleLabel.fontName = CustomFont.jbmBold
        titleLabel.fontColor = .white
        titleLabel.text = "탄소 수호자"
        
        titleLabel.fontSize = 50
        titleLabel.horizontalAlignmentMode = .center
        titleLabel.verticalAlignmentMode = .center
        titleLabel.position = CGPoint(x:scenceWidth/2 , y: scenceHeight/2)
        titleLabel.zPosition = Layer.zMax
        
        
        self.addChild(titleLabel)
        
        
        let startButton = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 300, height: 200))
        
        startButton.fillColor = .red
        
        startButton.position = CGPoint(x: titleLabel.position.x, y: titleLabel.position.y  - startButton.frame.size.height - 50)
        
        startButton.position
        startButton.name = "startBtn"
        
        
        
        self.addChild(startButton)
        
    }
}
