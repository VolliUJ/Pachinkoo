

import SpriteKit


class GameScene: SKScene {
    
    var scoreLabel : SKLabelNode!
    
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    override func didMove(to view: SKView) {
        makeBackground()
        makeScoreLabel()
        
        makeBouncer(at: CGPoint(x: 0, y: 0))
        makeBouncer(at: CGPoint(x: size.width / 2, y: 0))
        makeBouncer(at: CGPoint(x: size.width, y: 0))
        
        makeSlot(at: CGPoint(x: size.width * 0.25 , y: 20), isGood: true)
        makeSlot(at: CGPoint(x: size.width * 0.75 , y: 20), isGood: false)
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self
    }
    
    func test(){
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        if let touch = touches.first {
            let location = touch.location(in: self)
            makeBall(at: location)
        }
    }
}
