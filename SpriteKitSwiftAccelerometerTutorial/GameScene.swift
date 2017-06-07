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
import os.log

class GameScene: SKScene {
    // Create a sprite
    let player = SKSpriteNode(imageNamed: "Spaceship")
    let motionManager = CMMotionManager()
    
    var posx:CGFloat = 0
    var posy:CGFloat = 0
    var sign:CGFloat = 1
    
    func degrees(radians:Double) -> Double {
        return 180 / .pi * radians
    }
    
    //handle accelerometer values updates
    func handleDeviceMotionUpdate(deviceMotion:CMDeviceMotion) {
        let attitude = deviceMotion.attitude
        let roll = degrees(radians: attitude.roll)
        let pitch = degrees(radians: attitude.pitch)
        movePlayer(roll: roll, pitch: pitch)
    }
    
    func movePlayer(roll: Double, pitch: Double) {
        if(roll < 0) {
            posx -= 5
        } else {
            posx += 5
        }
        if(pitch > 0) {
            posy -= 5
        } else {
            posy += 5
        }
        
        if(posx > size.width) {
            posx = size.width
        } else if (posx < 0) {
            posx = 0
        }
        if(posy > size.height) {
            posy = size.height
        } else if (posy < 0) {
            posy = 0
        }
    
        player.position = CGPoint(x: posx, y: posy)
    }
    
    override func didMove(to view: SKView) {
        os_log("didmove", type: .debug)
        
        backgroundColor = SKColor.black
        posx = size.width/2
        posy = size.height/2
        player.position = CGPoint(x: posx, y: posy)
        
        // get data of accelerometer async
        if motionManager.isDeviceMotionAvailable {
            motionManager.startDeviceMotionUpdates(to: OperationQueue.current!, withHandler: {
                (deviceMotion, error) -> Void in
                if(error == nil) {
                    self.handleDeviceMotionUpdate(deviceMotion: deviceMotion!)
                } else {
                    os_log("Error in starting device motion updates", type: .debug)
                }
            })
        }
        
        //to make the sprite appear, must add it as a child
        addChild(player)
    }
}
