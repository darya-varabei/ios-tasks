import UIKit
import Foundation

class Instrument{// root class for all instruments
    let brand: String
    
    init(brand: String){
        self.brand = brand
    }
    
    func tune() -> String{
        fatalError("Implement this method for \(brand)")
    }
    
    func play(_ music: Music) -> String{
        return music.prepared()
    }
    
    func perform(_ music: Music){
        print(tune())
        print(play(music))
    }
}


class Music{
    let notes: [String]
    
    init(notes: [String]) {
        self.notes = notes
    }
    
    func prepared() -> String {
        return notes.joined(separator: " ")
    }
}

class Piano: Instrument { //inherited from Instruments and overwrites its methods, as all instruments have different tunes. play and additional properties(hasPedals)
    let hasPedals: Bool
    
    static let whiteKeys = 52
    static let blackKeys = 36
    
    init(brand: String, hasPedals: Bool = false) {
        self.hasPedals = hasPedals
        
        super.init(brand: brand)// inherits initializer from superclass
    }
    
    override func tune() -> String {
        return "Piano standart tuning for brand"
    }
    
    override func play(_ music: Music) -> String {
      return play(music, usingPedals: hasPedals)
    }
    
    func play(_ music: Music, usingPedals: Bool) -> String{
        let preparedNotes = super.play(music)
        if hasPedals && usingPedals {
            return "With pedals \(preparedNotes)"
        }
        
        else{
            return "Without pedals \(preparedNotes)"
        }
    }
}


class Guitar: Instrument { // subclass of Instruments, but does not override any methods as it is itself a superclass for other types of guitars, which will implement methods on their own
    let stringGauge: String
    init(brand: String, stringGauge: String = "medium") {
        self.stringGauge = stringGauge
        super.init(brand: brand) // inherits a part of initializer from super class
    }
}


class AcousticGuitar: Guitar { // subclass of guitar, overrides methods deffined in Instrument
    static let numberOfStrings = 6
    static let fretCount = 20
    
    override func tune() -> String {
        return "Tune \(brand) acoustic with E A D G B E"
    }
    
    override func play(_ music: Music) -> String {
        let preparedNotes = super.play(music)
        return "Play folk tune on trets \(preparedNotes)"
    }
}


class Amplifier {
    
    private var _volume: Int
    private(set) var isOn: Bool
    
    init() {
        isOn = false
        _volume = 0
    }
    
    func plugIn() {
        isOn = true
    }
    
    func unplug(){
        isOn = false
    }
    
    var volume: Int {
        
        get {
            return isOn ? _volume : 0
        }
        
        set {
            _volume = min(max(newValue, 0), 10)
        }
    }
}


class ElectricGuitar: Guitar{ //same as for AccousticGuitar
    let amplifier: Amplifier
    
    init(brand: String, stringGauge: String = "Light", amplifier: Amplifier){
        self.amplifier = amplifier
        super.init(brand: brand, stringGauge: stringGauge)
    }
    
    override func tune() -> String {
        amplifier.plugIn()
        amplifier.volume = 5
        
        return "Tune \(brand) electric with E A D G B E"
    }
    
    override func play(_ music: Music) -> String {
        let preparedNotes = super.play(music)
        return "Play solo \(preparedNotes) at volume \(amplifier.volume)."
    }
}


class BassGuitar: Guitar {//same as for AccousticGuitar
    let amplifier: Amplifier
    
    init(brand: String, stringGauge: String = "heavy", amplifier: Amplifier){
        self.amplifier = amplifier
        super.init(brand: brand, stringGauge: stringGauge)
    }
    
    override func tune() -> String {
        amplifier.plugIn()
        return "Tune \(brand) bass with E A D G"
    }
    
    override func play(_ music: Music) -> String {
        let preparedNotes = super.play(music)
        return  "Play bass line \(preparedNotes) at volume \(amplifier.volume)."
    }
}
