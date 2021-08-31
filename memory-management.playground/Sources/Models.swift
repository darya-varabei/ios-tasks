import Foundation

class Team {
    var coach: Coach?
    
    init(){
        print("Team is initialized")
    }
    
    deinit{
        print("Team is deinitialized")
    }
}

class Coach {
    var name: String
    var team: Team?
    
    init(name: String){
        self.name = name
        print("Coach is initialized")
    }
    
    deinit{
        print("Coach is deinitialized")
    }
}
