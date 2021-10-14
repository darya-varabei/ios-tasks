import UIKit

class RGBColors: NSObject {
    
    static let redLight = "RED"
    static let greenLight = "GREEN"
    static let blueLight = "BLUE"
    func startSwitching() {
        
        let operationQueue = OperationQueue()
        operationQueue.name = "Operation_queue"
        
        let redElements = BlockOperation {
            for _ in 0...10 {
                print(RGBColors.redLight)
            }
        }
        
        let greenElements = BlockOperation {
            for _ in 0...10 {
                print(RGBColors.greenLight)
            }
        }
        
//        let blueElements = BlockOperation {
//            for _ in 0...10 {
//                print(RGBColors.blueLight)
//            }
//        }
        
        operationQueue.addOperation {
            for _ in 0...10 {
                print(RGBColors.blueLight)
            }
        }
        
        operationQueue.addOperation(redElements)
        operationQueue.addOperation(greenElements)
        //operationQueue.addOperation(blueElements)
        
        operationQueue.waitUntilAllOperationsAreFinished()
    }
}

let colorScheme = RGBColors()
colorScheme.startSwitching()

class Schedule {
    func actions() {
        let operationQueue = OperationQueue()
        operationQueue.name = "morning_schedule"
        operationQueue.maxConcurrentOperationCount = 3
        
        let bedroom = BlockOperation {
            print("Wake up")
            sleep(1)
            print("Make up bed")
            sleep(1)
        }
        
        let bathroom = BlockOperation {
            print("Take bath")
            sleep(1)
            print("Brush teeth")
            sleep(1)
            print("Clean face")
            sleep(1)
        }
        
        let kitchen = BlockOperation {
            print("Cook breakfast")
            sleep(1)
            print("Eat breakfast")
            sleep(1)
            print("Drink coffee")
            sleep(1)
        }
        
        let mobilePhone = BlockOperation {
            print("Check email")
            sleep(1)
            print("Check instagram")
            sleep(1)
            print("Check telegram")
            sleep(1)
        }
        
        bathroom.addDependency(bedroom)
        kitchen.addDependency(bathroom)
        mobilePhone.addDependency(bathroom)
        
        
        operationQueue.addOperation(mobilePhone)
        operationQueue.addOperation(bedroom)
        operationQueue.addOperation(bathroom)
        operationQueue.addOperation(kitchen)
    }
}

let schedule = Schedule()
schedule.actions()
