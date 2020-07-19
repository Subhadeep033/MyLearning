
protocol AdvanceLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate : AdvanceLifeSupport?
    
    func getStatus(){
        print("It's an emergency, need life support.")
    }
    
    func emergency(){
        delegate?.performCPR()
    }
}

struct Paramedic : AdvanceLifeSupport {
    init(handler : EmergencyCallHandler) {
        handler.delegate = self
    }
    func performCPR() {
        print("Paramedic Arrives")
    }
}

class Doctor: AdvanceLifeSupport {
    init(handler : EmergencyCallHandler) {
        handler.delegate = self
    }
    func performCPR() {
        print("Doctor Arrives")
    }
    func useStethescope(){
        print("Listening Heart beat.")
    }
}

class Surgeon : Doctor{
    override func performCPR() {
        super.performCPR()
        print("Give medicine")
    }
}

let emilio = EmergencyCallHandler()
let pit = Surgeon(handler: emilio)

emilio.getStatus()
emilio.emergency()
