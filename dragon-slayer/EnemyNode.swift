//
//  PlayerNode.swift
//  TextShooter
//
//  Created by Kim Topley on 11/9/15.
//  Copyright © 2015 Apress Inc. All rights reserved.
//

import SpriteKit

class EnemyNode: SKNode {
    override init() {
        super.init()
        name = "Player \(self)"
        initObject()
    }
    
    func initObject(){
        let sprite = SKSpriteNode(imageNamed:"stop")

        sprite.xScale = -1
        sprite.yScale = 1
        sprite.position = CGPointMake(3, 5)
        
        //let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
        //sprite.runAction(SKAction.repeatActionForever(action))
        
        self.addChild(sprite)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func stopAction(){
        
    }
    func stageEnter(){
        //moveToward(<#T##location: CGPoint##CGPoint#>)
    }
    func stageExit(){
        
    }
    
    
    func moveToward(location: CGPoint, duration: Double) {
        
        removeActionForKey("movement")
        runAction(SKAction.moveTo(location, duration: duration),
            withKey:"movement")
    }
    
    func receiveAttacker(attacker: SKNode, contact: SKPhysicsContact) {
        let path = NSBundle.mainBundle().pathForResource("EnemyExplosion",
            ofType: "sks")
        let explosion = NSKeyedUnarchiver.unarchiveObjectWithFile(path!)
            as! SKEmitterNode
        explosion.numParticlesToEmit = 50
        explosion.position = contact.contactPoint
        scene!.addChild(explosion)
        
        runAction(SKAction.playSoundFileNamed("playerHit.wav",
            waitForCompletion: false))
    }
}
