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
    var sign:CGFloat = 1
    
    func degrees(radians:Double) -> Double {
        return 180 / .pi * radians
    }
    
    func handleDeviceMotionUpdate(deviceMotion:CMDeviceMotion) {
        let attitude = deviceMotion.attitude
        let roll = degrees(radians: attitude.roll)
        let pitch = degrees(radians: attitude.pitch)
        let yaw = degrees(radians: attitude.yaw)
        print("r: \(roll), p: \(pitch), y: \(yaw)")
    }
    
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
        os_log("didmove", type: .debug)
        
        backgroundColor = SKColor.black
        player.position = CGPoint(x: posx, y: size.height/2)
        
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
    
    override func update(_ currentTime: TimeInterval) {
        movePlayer()
    }
}
