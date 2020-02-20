import SpriteKit
import GameplayKit

class Island: GameObject
{
    
    
    //constructor
    init()
    {
        super.init(imageString: "island", initialScale: 2.0)
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
        if(self.position.x <= -515) // note maybe reset earlier
        {
            self.Reset()
        }
        
       /* // right boundary
        if(self.position.x >= 307 - self.halfWidth!)
        {
            self.position.x = 307 - self.halfWidth!
        }
        
        // left boundary
        if(self.position.x <= -307 + self.halfWidth!)
        {
            self.position.x = -307 + self.halfWidth!
        }*/
    }
    
    func Move()
    {
        self.position.x -= self.dx!
    }
    
    override func Reset()
    {
        self.position.y = CGFloat(arc4random_uniform(UInt32(200))) - 100
        self.position.x = CGFloat(arc4random_uniform(UInt32(470))) + 470
        
        self.isColliding = false
       /* self.position.y = 715
        let randomX:Int = (randomSource?.nextInt(upperBound: 614))! - 307
        self.position.x = CGFloat(randomX)
        self.isColliding = false*/
    }
    
    override func Start()
    {
        self.zPosition = 1
        self.Reset()
        self.dx = 5.0
    }
    
    override func Update()
    {
        self.Move()
        self.CheckBounds()
    }
}
