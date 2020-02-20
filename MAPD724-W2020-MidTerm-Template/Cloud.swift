//
//  Game Name: Mail Pilot
//  Source File Name : Cloud.Swift
//  Author’s Name : Dipal Patel
//  Student Number : 301090880
//  Test Date : 19 feb 2020
//
import SpriteKit
import GameplayKit

class Cloud: GameObject
{
    
    
    //constructor
    init()
    {
        super.init(imageString: "cloud", initialScale: 1.5)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Life Cycle Functions
    override func CheckBounds()
    {
        // bottom boundary
        if(self.position.x <= -760) // note maybe reset earlier
        {
            self.Reset()
        }
        // right boundary
        if(self.position.y >= 320 - self.halfWidth!)
        {
            self.position.y = 320 - self.halfWidth!
        }
        
        // left boundary
        if(self.position.y <= -320 + self.halfWidth!)
        {
            self.position.y = -320 + self.halfWidth!
        }
    }
    
    func Move()
    {
        self.position.y -= self.dy!
        self.position.x -= self.dx!
    }
    
    override func Reset()
    {
        self.position.y = CGFloat(arc4random_uniform(UInt32(680))) - 340
        self.position.x = CGFloat(arc4random_uniform(UInt32(470))) + 470
        self.dx = CGFloat((randomSource?.nextUniform())! * 5.0) + 7.0
        self.dy = CGFloat((randomSource?.nextUniform())! * -4.0) + 2.0
        self.isColliding = false
    }
    
    override func Start()
    {
        self.zPosition = 3
        self.Reset()
        self.alpha = 0.5
    }
    
    override func Update()
    {
        self.Move()
        self.CheckBounds()
    }
    
    
}
