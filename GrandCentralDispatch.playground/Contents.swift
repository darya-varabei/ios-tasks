import UIKit

let serialQueue = DispatchQueue(label: "Serial queue")
let serialGroup = DispatchGroup()
var counter = 10

serialQueue.async(group: serialGroup) {
    
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

func asyncQueues() {
    
    let small = DispatchQueue(label: "task_small")
    let medium = DispatchQueue(label: "task_medium")
    let large = DispatchQueue(label: "task_large")
    let veryLarge = DispatchQueue(label: "task_very_large")
    
    small.async {
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

asyncQueues()

struct ToDo: Decodable {
  let userId: Int
  let id: Int
  let title: String
  let isComplete: Bool
  
  enum CodingKeys: String, CodingKey {
    case isComplete = "completed"
    case userId, id, title
  }
}

extension URLSession {
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


DispatchQueue.global(qos: .background).async {
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
    URLSession.shared.fetchData(at: url) { result in
    }
}

print("Task after asynchronous queue")

var label = UILabel()

DispatchQueue.global(qos: .background).async {
    for i in 1...100 {
        counter += i
    }
    
    DispatchQueue.main.async {
        print(counter)
        label.text = String(counter)
    }
}

func qosPriorities() {
    let userInitQueue = DispatchQueue(label: "com.app.userInitQueue", qos: .userInitiated)
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

DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: qosPriorities)
  
