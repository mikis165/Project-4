import Foundation

class Interest: CustomStringConvertible, Equatable {
    var name: String
    var describe: String
    
    
    init(name: String, describe: String){
        self.name = name
        self.describe = describe
    }
    
    var description: String {
        return "\(self.name): \(self.describe)"
    }
    
    static func == (lhs: Interest, rhs: Interest) -> Bool {
        return lhs.name == rhs.name
    }
    
}

class Person: CustomStringConvertible {
    var name: String
    var hometown: String
    var age: Int
    var interests: [Interest]
    
    init(name: String, hometown: String, age: Int, interests: [Interest]) {
        self.name = name
        self.hometown = hometown
        self.age = age
        self.interests = interests
    }
    
    var description: String {
        
        return "My name is \(self.name) i am \(self.age) years old and i lives in \(self.hometown) and my interest are \(self.interests[0])\n"
        
        
    }
    
    func introduce() {
        // greeting, name and age
        let greetings = ["Hi", "Hello", "Hey"]
        var introduction = "\(greetings.randomElement()!), I'm \(name), and I'm \(age) years old."
        
        introduction += " I'm interested in"
        
        // different grammar & punctuation options
        for (idx, eachInterest) in interests.enumerated() {
            if interests.count == 1 {
                introduction += " \(eachInterest.name)."
            }
            else if idx == interests.endIndex-1 {
                introduction += " and \(eachInterest.name)."
            }
            else if idx == interests.endIndex-2 {
                introduction += " \(eachInterest.name)"
            }
            else {
                introduction += " \(eachInterest.name),"
            }
        }
        
        print(introduction)
    }
    
}

let p1 = Interest(name: "Cuisine", describe: "Street food")
let p2 = Interest(name: "Fishing", describe: "Tuna fishing")
let p3 = Interest(name: "Basketball", describe: "NBA")
let p4 = Interest(name: "Hiking", describe: "Mountain hiking")
let p5 = Interest(name: "Design", describe: "Art design")
let p6 = Interest(name: "Gaming", describe: "Unreal Tournamnet")
let p7 = Interest(name: "Chess", describe: "Indoor sport for brain")
let p8 = Interest(name: "Football", describe: "Most popular sport")
let p9 = Interest(name: "Painting", describe: "Artistic hobbt")
let p10 = Interest(name: "Badminton", describe: "Indoor Sport")

let interests = [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]
let name = ["Mic", "Jon", "Mark", "Andrew", "Kate", "Cloe", "Matt", "Lucy", "Zack", "Charls", "Peter"]
let locations = ["Milan", "Venice", "Berlin", "Madrid", "New York", "Paris", "San Francisco", "LA", "Mosca", "Tokio", "Nairobi"]



func generateRandomName() -> String {
    return name.randomElement()!
}


func generateRandomLocation () -> String {
    return locations.randomElement()!
}

func generateRandomInterests() -> [Interest] {
    let randomSize = Int.random(in: 1...interests.count)
    let shuffled = interests.shuffled()
    let spliced = shuffled[0...(randomSize-1)]
    return Array(spliced)
}

extension Array where Element: Hashable {
    func differenceIntrests(from other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))
    }
}



let numberOfPlayers = arc4random()

var players = [Person]()

for _ in 1...11 {
    
    let person = Person(name: generateRandomName(), hometown: generateRandomLocation(), age: Int.random(in: 18...40), interests: generateRandomInterests())
    
    players.append(person)
}
print("Following are the players: ")
print("-------------------------------------------------------------------------------")
for player in players {
    player.introduce()
    print("-------------------------------------------------------------------------------")
}

print("-------------------------------------------------------------------------------")

for i in 0..<(players.count - 1) {
    
    for j in (i+1)..<(players.count) {
        let playerOne = players[i]
        let playerTwo = players[j]
        let difference = playerOne.interests.difference(from: playerTwo.interests)
        let diffCount = difference.count
        if(diffCount == 0) {
            print("\(playerOne.name) has same interests as \(playerTwo.name). They can not be matched.")
        } else {
            print("\(playerOne.name) and \(playerTwo.name) have \(diffCount) interests which do not match. So they can be matched together.")
            print("-------------------------------------------------------------------------------------")
        }
    }
}

