//
//  PlayerNode.swift
//  TextShooter
//
//  Created by Kim Topley on 11/9/15.
//  Copyright © 2015 Apress Inc. All rights reserved.
//

import SpriteKit

class PlayerNode: SKNode {
    
    var playerAttackFrames : [SKTexture]!
    var playerWalkingFrames : [SKTexture]!
    var playerSprite = SKSpriteNode(imageNamed:"stop")
    
    override init() {
        super.init()
        name = "Player \(self)"
        initObject()
        initAnimation()
    }
    
    
    func walkingPlayer() {
        playerSprite.removeActionForKey("walkingInPlacePlayer")
        //This is our general runAction method to make our bear walk.
        playerSprite.runAction(SKAction.repeatActionForever(
            SKAction.animateWithTextures(playerWalkingFrames,
                timePerFrame: 0.1,
                resize: false,
                restore: true)),
            withKey:"walkingInPlacePlayer")
    }
    
    func attackPlayer() {
        playerSprite.removeActionForKey("attackInPlacePlayer")
        //This is our general runAction method to make our bear walk.
        playerSprite.runAction(
            SKAction.animateWithTextures(playerAttackFrames,
                timePerFrame: 0.1,
                resize: false,
                restore: true),
            withKey:"attackInPlacePlayer")
    }
    
    func initAnimation(){
        
        let heroWalkAtlas = SKTextureAtlas(named: "HeroWalk")
        var heroWalkFrames = [SKTexture]()
        heroWalkFrames = createAnimation(heroWalkAtlas, name: "walk")
        playerWalkingFrames = heroWalkFrames
        
        let heroAttackAtlas = SKTextureAtlas(named: "HeroAttack")
        var heroAttackFrames = [SKTexture]()
        heroAttackFrames = createAnimation(heroAttackAtlas, name: "attack")
        playerAttackFrames = heroAttackFrames
        
    }
    
    func createAnimation(atlas:SKTextureAtlas, name:String) -> [SKTexture]{
        let numImages = atlas.textureNames.count
        var frames = [SKTexture]()
        for var i=1; i<=numImages; i++ {
            let textureName = name+String(i)
            frames.append(atlas.textureNamed(textureName))
        }
        return frames
    }
    
    func initObject(){
        
        
        playerSprite.xScale = 1
        playerSprite.yScale = 1
        playerSprite.position = CGPointMake(3, 5)
        
        //let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
        //sprite.runAction(SKAction.repeatActionForever(action))
        
        self.addChild(playerSprite)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func stopAction(){
        playerSprite.removeActionForKey("walkingInPlacePlayer")
        playerSprite.xScale = 1
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
