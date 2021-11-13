import UIKit

// MARK:- ASync definition
let serialQueue = DispatchQueue(label: "Serial queue")
let serialGroup = DispatchGroup()
var counter = 10

serialQueue.async(group: serialGroup) { // async means that stepping into clisure doesn't block the calling thread

    sleep(1)
    counter += 10
    print("Increase to \(counter)")
}

serialQueue.async(group: serialGroup) {

    sleep(1)
    counter -= 20
    print("Decrease to \(counter)")
}
serialGroup.wait()

print("Task is done")

// MARK:- Queues completion order
func asyncQueues() {

    let small = DispatchQueue(label: "task_small")
    let medium = DispatchQueue(label: "task_medium")
    let large = DispatchQueue(label: "task_large")
    let veryLarge = DispatchQueue(label: "task_very_large")

    small.async { // when we use multuple closures with async in GCD, we can not be sure about the order of ther completion. If closues contain cycles which have some output, this output order is also undefined
        for number in 1...10 {
            print("Small number \(number)")
        }
    }

    medium.async {
        for number in 100...105 {
            print("Medium number \(number)")
        }
    }

    large.async {
        for number in 1000...1005 {
            print("Large number \(number)")
        }
    }

    veryLarge.async {
        for number in 5000...5005 {
            print("Very large \(number)")
        }
    }
}

asyncQueues() // numbers are displayed in undefined order

struct ToDo: Decodable { // model for fetching data from api
  let userId: Int
  let id: Int
  let title: String
  let isComplete: Bool

  enum CodingKeys: String, CodingKey {
    case isComplete = "completed"
    case userId, id, title
  }
}

// MARK:- Running long tasks in other thread
extension URLSession { // fetching data from API is a long running tasks, which blocks app when is run from main thread. So it is always better to move it to another thread
  func fetchData(at url: URL, completion: @escaping (Result<[ToDo], Error>) -> Void) {
    self.dataTask(with: url) { (data, response, error) in

      if let error = error {
        completion(.failure(error))
      }

      if let data = data {
        do {
          let toDos = try JSONDecoder().decode([ToDo].self, from: data)
          completion(.success(toDos))

            for item in toDos[1...5] {
                print(item.title)
            }

        } catch let decoderError {
          completion(.failure(decoderError))
        }
      }
    }.resume()
  }
}

DispatchQueue.global(qos: .background).async {// moves feching data from the main thread to global with quality of service of background(mediun priority)
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
    URLSession.shared.fetchData(at: url) { result in
    }
}

print("Task after asynchronous queue")

// MARK:- Returning to main with UI task
var label = UILabel()

DispatchQueue.global(qos: .background).async { // also moved ffrom main thread to global to perform non-UI task
    for i in 1...100 {
        counter += i
    }

    DispatchQueue.main.async {// but if we need to complete UI task inside global thread closure, we need to bring it back to main thread
        print(counter)
        label.text = String(counter)
    }
}

// MARK:- QoS definition
func qosPriorities() {
    let userInitQueue = DispatchQueue(label: "com.app.userInitQueue", qos: .userInitiated)// global queues have different priorities(QoS), which affects the order of queues completion
    let utilityQueue = DispatchQueue(label: "com.app.utilityQueue", qos: .utility)
    let backgroundQueue = DispatchQueue(label: "com.app.backgroundQueue", qos: .background)

    backgroundQueue.async {
        for _ in 1..<10 {
            print("background")
        }
    }

    utilityQueue.async {
        for _ in 1..<10 {
            print("utility")
        }
    }

    userInitQueue.async {
        for _ in 1..<10 {
            print("userInitiated")
        }
    }
}

DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: qosPriorities) // as we can see from the output even though userInitQueue is initialized last, it is completed first, as it has the highet priority

// MARK:- .cancel and .notify keywords
var wordsOutput: DispatchWorkItem? // DispatchWorkItem is a unit of task to be cimpleted in queue
let programmingLanguages = ["C++", "C#", "Swift", "Java", "PHP", "Python", "Javascript", "Objective-C", "Ruby"]
wordsOutput = DispatchWorkItem {
    for word in programmingLanguages{
        guard let language = wordsOutput, !language.isCancelled else {
            print("Flow is cancelled")
            break
        }
        sleep(1)
        print(word)
    }
}

wordsOutput?.notify(queue: .main) { // when tasks in group are completed they notify the main thread
    print("Task is done")
}

DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(3)) {
    wordsOutput?.cancel()// performance inside closure will be cancelled in 3 seconds
}
DispatchQueue.main.async(execute: wordsOutput!)

func longTestTask() {
    let group = DispatchGroup()

    for i in 1...5 {
        group.enter()
        DispatchQueue.global().async {
            sleep(arc4random() % 4)
            print("Task \(i) is done")
            group.leave()
        }
    }
    group.wait()
    print("Test task is finished")
}

longTestTask()

let taskQueue = DispatchQueue.global(qos: .userInitiated)
let testGroup = DispatchGroup()

taskQueue.async(group: testGroup) {
    sleep(arc4random() % 3)
}

taskQueue.async(group: testGroup) {
    sleep(arc4random() % 6)
}

if testGroup.wait(timeout: .now() + 4) == .timedOut {
    print("all task not completed within 4 sec")
} else {
    print("all task completed within 4 sec")
}
