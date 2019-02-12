//
//  ConfettiViewFactory.swift
//  GoalieList
//
//  Created by Kolten Fluckiger on 1/25/19.
//  Copyright © 2019 Kolten Fluckiger. All rights reserved.
//

import Foundation
import UIKit

class ConfettiView: UIView {
    
    let confettiLayer = CAEmitterLayer()
    let confettiCell = CAEmitterCell()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        display()
    }
    
    func display(){
        
        confettiLayer.frame = self.bounds
        
        confettiCell.isEnabled = true
        confettiCell.contents = UIImage(named: "confettiSquare.png")?.cgImage
        confettiCell.contentsRect = CGRect(origin: CGPoint.zero, size: CGSize(width: 10, height: 10))
        confettiCell.color = UIColor(hue: 0.0, saturation: 0.0, brightness: 0.0, alpha: 1.0).cgColor
        confettiCell.redRange = 1.0
        confettiCell.greenRange = 1.0
        confettiCell.blueRange = 1.0
        confettiCell.alphaRange = 0.0
        confettiCell.redSpeed = 0.0
        confettiCell.greenSpeed = 0.0
        confettiCell.blueSpeed = 0.0
        confettiCell.alphaSpeed = -0.5
        confettiCell.birthRate = 15.0
        confettiCell.lifetime = 15.0
        confettiCell.lifetimeRange = 0
        confettiCell.scale = 0.1
        confettiCell.scaleRange = 0.25
        confettiCell.velocity = CGFloat(100)
        confettiCell.velocityRange = 0
        confettiCell.emissionLongitude = CGFloat.pi
        confettiCell.emissionRange = 0.5
        confettiCell.spin = 3.5
        confettiCell.spinRange = 1
        
        confettiLayer.emitterShape = .line
        confettiLayer.emitterPosition = CGPoint(x: self.bounds.size.width / 2, y: 0)
        confettiLayer.emitterSize = self.bounds.size
        confettiLayer.drawsAsynchronously = true
        confettiLayer.emitterCells = [confettiCell]
        confettiLayer.renderMode = .additive
        
        self.layer.addSublayer(confettiLayer)
    }
}
