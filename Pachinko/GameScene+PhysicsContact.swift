//
//  GameScene+PhysicsContact.swift
//  Pachinko
//
//  Created by MGOLLI on 19/12/2018.
//  Copyright © 2018 MGOLLI. All rights reserved.
//

import SpriteKit

extension GameScene : SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard
        let nodeA = contact.bodyA.node,
        let nodeB = contact.bodyB.node
        else { return }
        
        if nodeA.name == SpriteNames.ball {
            collisionBetween(ball: nodeA, object: nodeB)
        } else if nodeB.name == SpriteNames.ball {
            collisionBetween(ball: nodeB, object: nodeA)
        }
    }
    
    func collisionBetween(ball: SKNode, object: SKNode) {
        if object.name == SpriteNames.slotGood {
            score += 1
            destroy(ball: ball)
        } else if object.name == SpriteNames.slotBad {
            score -= 1
            destroy(ball: ball)
        }
    }
    
    func destroy(ball: SKNode) {
        ball.removeFromParent()
    }
    
}
