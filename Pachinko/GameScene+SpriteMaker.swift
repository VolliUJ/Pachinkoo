//
//  GameScene+SpriteMaker.swift
//  Pachinko
//
//  Created by MGOLLI on 19/12/2018.
//  Copyright © 2018 MGOLLI. All rights reserved.
//

import SpriteKit

extension GameScene {
    
    func makeScoreLabel() {
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.text = "Score: 0"
        scoreLabel.horizontalAlignmentMode = .right
        let x = size.width
        let y = size.height - scoreLabel.halfHeight - 10
        scoreLabel.position = CGPoint(x: x, y: y)
        addChild(scoreLabel)
    }
    
    func makeBackground() {
        let background = SKSpriteNode(imageNamed: "background.jpg")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.blendMode = .add
        background.zPosition = -1
        addChild(background)
    }
    
    func makeBall(at position: CGPoint){
        let ball = SKSpriteNode(imageNamed: "ballRed")
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.halfWidth)
        ball.physicsBody?.restitution = 0.5
        ball.physicsBody?.contactTestBitMask = ball.physicsBody!.collisionBitMask
        ball.position = position
        ball.name = SpriteNames.ball
        addChild(ball)
        
        print("VTag ball colision bitmask: \(ball.physicsBody?.collisionBitMask)")
    }
    
    func makeBouncer(at position: CGPoint) {
        let bouncer = SKSpriteNode(imageNamed: "bouncer")
        bouncer.position = position
        bouncer.physicsBody = SKPhysicsBody(circleOfRadius: bouncer.size.width / 2.0)
        bouncer.physicsBody?.isDynamic = false
        
        addChild(bouncer)
    }
    
    func makeSlot(at position: CGPoint, isGood: Bool) {
        
        var slotBase : SKSpriteNode
        var slotGlow : SKSpriteNode
        
        if isGood {
            slotBase = SKSpriteNode(imageNamed: "slotBaseGood")
            slotGlow = SKSpriteNode(imageNamed: "slotGlowGood")
            slotBase.name = SpriteNames.slotGood
        } else {
            slotBase = SKSpriteNode(imageNamed: "slotBaseBad")
            slotGlow = SKSpriteNode(imageNamed: "slotGlowBad")
            slotBase.name = SpriteNames.slotBad
        }

        slotBase.position = position
        slotGlow.position = position
        
        slotBase.physicsBody = SKPhysicsBody(rectangleOf: slotBase.size)
        slotBase.physicsBody?.isDynamic = false
        
        let rotateAction = SKAction.rotate(byAngle: .pi, duration: 10)
        let rotateForever = SKAction.repeatForever(rotateAction)
        slotGlow.run(rotateForever)

        addChild(slotBase)
        addChild(slotGlow)
    }
}
