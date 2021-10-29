import UIKit
import Foundation

class RGBColors: NSObject {

    static let redLight = "RED"
    static let greenLight = "GREEN"
    static let blueLight = "BLUE"
    func startSwitching() {

        let operationQueue = OperationQueue() //create object of operationQueue class
        operationQueue.name = "Operation_queue"

        let redElements = BlockOperation { //define variables of type BlockOperation with closures
            for _ in 0...10 {
                print(RGBColors.redLight)
            }
        }

        let greenElements = BlockOperation {
            for _ in 0...10 {
                print(RGBColors.greenLight)
            }
        }

       operationQueue.addOperation { //we can add operations to queue directly without defining objects themself
            for _ in 0...10 {
                print(RGBColors.blueLight)
            }
        }

        operationQueue.addOperation(redElements)
        operationQueue.addOperation(greenElements)

        operationQueue.waitUntilAllOperationsAreFinished() // wait for all operations to be finished to continue program execution
        //as a result ooutput from operations is recieved in random order, as they are asynchronous and do not have dependencies
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

        bathroom.addDependency(bedroom)// schedule tasks(bathroom starts execution only after bedroom is comleted etc)
        kitchen.addDependency(bathroom)
        mobilePhone.addDependency(bathroom)

        operationQueue.addOperation(mobilePhone)// add opeartions to queue
        operationQueue.addOperation(bedroom)
        operationQueue.addOperation(bathroom)
        operationQueue.addOperation(kitchen)
    }
}

let schedule = Schedule()
schedule.actions()

let queue = OperationQueue()
var workItem: BlockOperation?

//we can check conditions of work items in thread
print("Task is ready: ", workItem?.isReady ?? false)//checks if the task is comleted

workItem = BlockOperation {
    print("Task is in proccess: ", workItem!.isExecuting) // checks if task is currently in proccess
    
    var count = 0
    while count < 100 {
        count += 1
    }
}

print("Task is ready: ", workItem!.isReady)

workItem!.completionBlock = { // completion block is executed for queue items after their task is completed
    print("Task is in process: ", workItem!.isExecuting)
    print("Task is completed: ", workItem!.isFinished) // checks if task is not running any more
}

queue.addOperation(workItem!)

