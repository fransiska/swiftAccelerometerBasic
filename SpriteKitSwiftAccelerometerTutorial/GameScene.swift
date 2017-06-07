//
//  GameScene.swift
//  SpriteKitSwiftAccelerometerTutorial
//
//  Created by fransiska on 2017/06/07.
//  Copyright © 2017年 fransiska. All rights reserved.
//

import SpriteKit
import CoreMotion
import GameplayKit

class GameScene: SKScene {
    // Create a sprite
    let player = SKSpriteNode(imageNamed: "Spaceship")
    
    var posx:CGFloat = 0;
    
    func movePlayer() {
        player.position = CGPoint(x: size.width/2+posx, y: size.height/2)
        posx+=5.0
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        player.position = CGPoint(x: size.width/2, y: size.height/2)
        //to make the sprite appear, must add it as a child
        addChild(player)
        
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(movePlayer),
                SKAction.wait(forDuration: 1.0)
                ])))
    }
}
