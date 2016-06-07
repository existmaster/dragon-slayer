//
//  MainScene.swift
//  dragon-slayer
//
//  Created by existmaster on 2016. 6. 4..
//  Copyright © 2016년 JoNaRae. All rights reserved.
//

import SpriteKit

class MainScene: SKScene {
    
    var progressValue = 200
    let HealthBar = SKSpriteNode()
    let playerNode = PlayerNode()
    let enemyNode = EnemyNode()
    let buttonNode = ButtonNode()

    
    override init(size: CGSize) {
        super.init(size: size)
        // Setup
        backgroundColor = SKColor.whiteColor()
        
        
        let stageLabel = SKLabelNode(fontNamed: "ArialMT")
        stageLabel.text = "Stage : 0"
        stageLabel.fontSize = 12
        stageLabel.fontColor = SKColor.blackColor()
        
        stageLabel.verticalAlignmentMode = .Top
        stageLabel.horizontalAlignmentMode = .Left
        stageLabel.position = CGPointMake(0,
            frame.height)
        addChild(stageLabel)
        
        
        let scoreLabel = SKLabelNode(fontNamed: "ArialMT")
        scoreLabel.text = "Stage : 0"
        scoreLabel.fontSize = 12
        scoreLabel.fontColor = SKColor.blackColor()
        
        scoreLabel.verticalAlignmentMode = .Top
        scoreLabel.horizontalAlignmentMode = .Center
        scoreLabel.position = CGPointMake(frame.width/2,
            frame.height)
        addChild(scoreLabel)
        
        let goldLabel = SKLabelNode(fontNamed: "ArialMT")
        goldLabel.text = "Stage : 0"
        goldLabel.fontSize = 12
        goldLabel.fontColor = SKColor.blackColor()
        
        goldLabel.verticalAlignmentMode = .Top
        goldLabel.horizontalAlignmentMode = .Right
        goldLabel.position = CGPointMake(frame.width,
            frame.height)
        addChild(goldLabel)
        
        HealthBar.color = SKColor.greenColor()
        HealthBar.size = CGSize(width: self.frame.size.width, height: 30)
        HealthBar.position = CGPointMake(0, self.frame.size.height / 1.05)
        HealthBar.anchorPoint = CGPointMake(0.0, 0.5)
        HealthBar.zPosition = 4
        self.addChild(HealthBar)
        
        
        playerNode.position = CGPointMake(CGRectGetMinX(frame),
            CGRectGetHeight(frame) * 0.8)
        addChild(playerNode)
        
        enemyNode.position = CGPointMake(CGRectGetMaxX(frame),
            CGRectGetHeight(frame) * 0.8)
        addChild(enemyNode)
        
        buttonNode.position = CGPointMake(CGRectGetMidX(frame),
            CGRectGetHeight(frame) * 0.5)
        addChild(buttonNode)

        playerNode.walkingPlayer()
        
        playerNode.moveToward(CGPointMake(CGRectGetMidX(frame)-40, playerNode.position.y), duration: 3)
        enemyNode.moveToward(CGPointMake(CGRectGetMidX(frame)+40, enemyNode.position.y), duration: 3)

    }
    
    override func update(currentTime: NSTimeInterval) {
//        let percent = CGFloat((Float)(progressValue--)/200)
//        progressValue--
//        HealthBar.size = CGSize(width: self.frame.size.width*percent, height: 30)
//        if(playerNode.position.x != 0) {
//        if(playerNode.position.x == 50) {
//            print("nodeddd")
//        }
//        }
        
        if (playerNode.actionForKey("movement") == nil) {
            //stop just the moving to a new location, but leave the walking legs movement running
            playerNode.stopAction()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
    }
//    override func didMoveToView(view: SKView) {
//        
//    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let positionInScene = touch.locationInNode(self)
            let touchedNode = self.nodeAtPoint(positionInScene)
            
            if let name = touchedNode.name
            {
                if name == "apubutton"
                {
                    print("attack")
                    playerNode.attackPlayer()
                }
                if name == "dpubutton"
                {
                    print("defense")
                }
            }
            
        }
    }
    
}
