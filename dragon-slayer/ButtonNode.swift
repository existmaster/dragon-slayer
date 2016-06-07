//
//  ButtonNode.swift
//  dragon-slayer
//
//  Created by existmaster on 2016. 6. 6..
//  Copyright © 2016년 JoNaRae. All rights reserved.
//

import SpriteKit

class ButtonNode: SKNode {

    let attackPowerUpButton = SKSpriteNode(imageNamed: "Attack")
    let defensePowerUpButton = SKSpriteNode(imageNamed: "Defense")
    
    override init(){
        super.init()
        initObject()
        
    }
    
    func initObject(){
        attackPowerUpButton.name = "apubutton"
        attackPowerUpButton.position = CGPointMake(0, 50)
        addChild(attackPowerUpButton)
        defensePowerUpButton.name = "dpubutton"
        defensePowerUpButton.position = CGPointMake(0, -50)
        addChild(defensePowerUpButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}

