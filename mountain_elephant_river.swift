import UIKit

class BridgeController {
   
    //MARK: Properties
    var bridgeComponents: [String]
    var bridgeDeck: [String]
    var bridgePiers: [String]
    var bridgeFoundations: [String]
    var bridgeStructuralSupport: [String]
    var bridgeArchitecture: [String]
    var bridgeMaterials: [String]
   
    //MARK: Init
    init() {
        self.bridgeComponents = ["Deck", "Piers", "Foundations", "Structural Support", "Architecture", "Materials"]
        self.bridgeDeck = []
        self.bridgePiers = []
        self.bridgeFoundations = []
        self.bridgeStructuralSupport = []
        self.bridgeArchitecture = []
        self.bridgeMaterials = []
    }
   
    //MARK: Build Bridge
    func buildBridge() {
        buildBridgeDeck()
        buildBridgePiers()
        buildBridgeFoundations()
        buildBridgeStructuralSupport()
        buildBridgeArchitecture()
        buildBridgeMaterials()
    }
   
    //MARK: Build Bridge Deck
    func buildBridgeDeck() {
        for i in 0...100 {
            let deckComponent = "Bridge Deck Component #\(i)"
            bridgeDeck.append(deckComponent)
        }
    }
   
    //MARK: Build Bridge Piers
    func buildBridgePiers() {
        for i in 0...20 {
            let pierComponent = "Bridge Pier Component #\(i)"
            bridgePiers.append(pierComponent)
        }
    }
   
    //MARK: Build Bridge Foundations
    func buildBridgeFoundations() {
        for i in 0...20 {
            let foundationComponent = "Bridge Foundation Component #\(i)"
            bridgeFoundations.append(foundationComponent)
        }
    }
   
    //MARK: Build Bridge Structural Support
    func buildBridgeStructuralSupport() {
        for i in 0...50 {
            let structuralSupportComponent = "Bridge Structural Support Component #\(i)"
            bridgeStructuralSupport.append(structuralSupportComponent)
        }
    }
 
   //MARK: Build Bridge Architecture
    func buildBridgeArchitecture() {
        for i in 0...100 {
            let architectureComponent = "Bridge Architecture Component #\(i)"
            bridgeArchitecture.append(architectureComponent)
        }
    }
 
    //MARK: Build Bridge Materials
    func buildBridgeMaterials() {
        for i in 0...50 {
            let materialComponent = "Bridge Material Component #\(i)"
            bridgeMaterials.append(materialComponent)
        }
    }
}