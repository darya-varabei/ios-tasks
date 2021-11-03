import UIKit

var multilineString = """
    A multiline string literal includes all of the lines between its opening and closing quotation marks.
         The string begins on the first line after the opening quotation marks (\""") and ends on the line before the closing quotation marks,
    which means that neither of the strings below start or end with a line break:
    """
print(multilineString)


let sign = "\u{1F607} \u{2665} \u{1F60F} \u{1F496} \u{1F494}"
print(sign)

for character in sign {
    print("\u{1F494}\(character)")
}

let arrayOfStrings = ["Swift", "Objective-C", "Java", "Python", "JavaScript", "PHP"]
print(arrayOfStrings[0] + " " + arrayOfStrings[2] + " " + arrayOfStrings[4])

var string = "Swift is a new programming language for iOS, macOS, watchOS, and tvOS app development"
string.count
string += "\u{302}"
string.count
string[string.startIndex]
string[string.index(before: string.endIndex)]
string[string.index(after: string.startIndex)]
string[string.index(string.startIndex, offsetBy: 20)]

string.insert("\u{2665}", at: string.endIndex)

class StringOperations {
    
    var stringToOperate: String
    
    static let arrayOfStrings: [String] = [
    "Disaster-thriller: A story about mass peril, where the protagonist's job is to both survive, and to save many other people from a grim fate, often a natural disaster such as a storm or volcanic eruption, but may also be a terrorist attack or epidemic of some sort.",
        "Psychological thriller: emphasizes the psychological condition of the hero that presents obstacles to his objective, rather than the action. Some psychological thrillers are also about complicated stories that try to deliberately confuse the audience, often by showing them only the same confusing or seemingly nonsensical information that the hero gains.",
        "Crime thriller: A story that revolves around the life of detectives, mobs, or other groups associated with criminal events in the story.",
        "Techno-thriller: A story whose theme is usually technology, or the danger behind the technology people use, including the threat of cyber terrorism such as State of Fear.",
        "Paranoid fiction: works of literature that explore the subjective nature of reality and how it can be manipulated by forces in power. These forces can be external, such as a totalitarian government, or they can be internal, such as a character's mental illness or refusal to accept the harshness of the world they live in.",
        "Retropunk: As a wider variety of writers began to work with cyberpunk concepts, new subgenres of science fiction emerged, playing off the cyberpunk label, and focusing on technology and its social effects in different ways."
    ]
    
    init(stringToOperate: String) {
        self.stringToOperate = stringToOperate
    }
    
    func getSubstring(left: Int, right: Int) {
        let index = self.stringToOperate.index(string.startIndex, offsetBy: left)
        let anotherIndex = self.stringToOperate.index(string.startIndex, offsetBy: right)
        self.stringToOperate = String(self.stringToOperate[index..<anotherIndex])
    }
    
    func countThrillerTypes() -> Int {
        var thrillerCounter = 0
        for type in StringOperations.arrayOfStrings {
            if type.contains("thriller") {
                thrillerCounter += 1;
            }
        }
        return thrillerCounter
    }
    
    func showUnicode() {
        for scalar in self.stringToOperate.unicodeScalars {
            print("\(scalar.value) is \(scalar)")
        }
    }
    
    func arrayToString() -> String {
        return StringOperations.arrayOfStrings[0] + StringOperations.arrayOfStrings[1] + StringOperations.arrayOfStrings[2] + StringOperations.arrayOfStrings[3]
    }
    
    func searchForRetropunk() {
        for type in StringOperations.arrayOfStrings {
            if type.hasPrefix("Retropunk") {
                print("Retropunk is detected")
            }
        }
    }
}

let issues = StringOperations(stringToOperate: "In addition to familiar types, Swift introduces advanced types not found in Objective-C, such as tuples")
issues.getSubstring(left: 5, right: 40)
print(issues.stringToOperate)
issues.countThrillerTypes()
issues.showUnicode()
issues.arrayToString()
issues.searchForRetropunk()

let latin = "O"
let cyrylic = "О"
if latin == cyrylic {
    print("latin and cyrylic are equal")
}
else {
    print("Not equal")
}

let splitIntoWords = multilineString.lowercased().split(separator: "\n").map{$0.split(separator: " ")}
