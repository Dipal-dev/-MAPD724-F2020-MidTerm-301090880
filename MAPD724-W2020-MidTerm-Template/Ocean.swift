//
//  Game Name: Mail Pilot
//  Source File Name : Ocean.Swift
//  Author’s Name : Dipal Patel
//  Student Number : 301090880
//  Test Date : 19 feb 2020
//
import SpriteKit
import GameplayKit

class Ocean : GameObject
{
    //constructor
    init()
    {
        super.init(imageString: "ocean", initialScale: 1.172)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //GameObject Life Cycle Functions
    override func CheckBounds()
    {
           
        // check top boundary
        if(self.position.x <= -896) // note maybe reset earlier
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        self.position.x = 880
    }
    
    override func Start()
    {
        self.zPosition = 0
        self.Reset()
        self.dx = 5.0
    }
    
    override func Update() {
        Move()
        CheckBounds()
    }
    
    func Move()
    {
        self.position.x -= self.dx!
    }

}
