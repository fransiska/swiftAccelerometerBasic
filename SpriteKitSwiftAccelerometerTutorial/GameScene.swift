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
    
    var posx:CGFloat = 0
    var sign:CGFloat = 1
    
    func movePlayer() {
        player.position = CGPoint(x: posx, y: size.height/2)
        
        
        if(posx > size.width) {
            sign = -1
        } else if(posx < 0) {
            sign = 1
        }
        posx += sign*5
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        player.position = CGPoint(x: posx, y: size.height/2)
        //to make the sprite appear, must add it as a child
        addChild(player)
    }
    
    override func update(_ currentTime: TimeInterval) {
        movePlayer()
    }
}
