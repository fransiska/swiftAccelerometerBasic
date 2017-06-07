//
//  GameViewController.swift
//  SpriteKitSwiftAccelerometerTutorial
//
//  Created by fransiska on 2017/06/07.
//  Copyright © 2017年 fransiska. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size: view.bounds.size)
        scene .scaleMode = .resizeFill
        
        let skView = view as! SKView
        skView.showsFPS = true
        skView.ignoresSiblingOrder = true
        skView.presentScene(scene)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
