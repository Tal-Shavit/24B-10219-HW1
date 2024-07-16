
import Foundation
import UIKit

class CardManeger{
    static let shared = CardManeger()
    
    let cardValues :[String : Int]
    let allCardNames: [String] = [ "1_of_clubs",
                                   "1_of_diamonds",
                                   "1_of_hearts",
                                   "1_of_spades",
                                   "2_of_clubs",
                                   "2_of_diamonds",
                                   "2_of_hearts",
                                   "2_of_spades",
                                   "3_of_clubs",
                                   "3_of_diamonds",
                                   "3_of_hearts",
                                   "3_of_spades",
                                   "4_of_clubs",
                                   "4_of_diamonds",
                                   "4_of_hearts",
                                   "4_of_spades",
                                   "5_of_clubs",
                                   "5_of_diamonds",
                                   "5_of_hearts",
                                   "5_of_spades",
                                   "6_of_clubs",
                                   "6_of_diamonds",
                                   "6_of_hearts",
                                   "6_of_spades",
                                   "7_of_clubs",
                                   "7_of_diamonds",
                                   "7_of_hearts",
                                   "7_of_spades",
                                   "8_of_clubs",
                                   "8_of_diamonds",
                                   "8_of_hearts",
                                   "8_of_spades",
                                   "9_of_clubs",
                                   "9_of_diamonds",
                                   "9_of_hearts",
                                   "9_of_spades",
                                   "10_of_clubs",
                                   "10_of_diamonds",
                                   "10_of_hearts",
                                   "10_of_spades",
                                   "11_of_clubs",
                                   "11_of_diamonds",
                                   "11_of_hearts",
                                   "12_of_clubs",
                                   "12_of_diamonds",
                                   "12_of_hearts",
                                   "12_of_spades",
                                   "13_of_clubs",
                                   "13_of_diamonds",
                                   "13_of_hearts",
                                   "13_of_spades"]
    
    private init(){
        cardValues = [
            "1_of_clubs": 14,
            "1_of_diamonds": 14,
            "1_of_hearts": 14,
            "1_of_spades": 14,
            "2_of_clubs": 2,
            "2_of_diamonds": 2,
            "2_of_hearts": 2,
            "2_of_spades": 2,
            "3_of_clubs": 3,
            "3_of_diamonds": 3,
            "3_of_hearts": 3,
            "3_of_spades": 3,
            "4_of_clubs": 4,
            "4_of_diamonds": 4,
            "4_of_hearts": 4,
            "4_of_spades": 4,
            "5_of_clubs": 5,
            "5_of_diamonds": 5,
            "5_of_hearts": 5,
            "5_of_spades": 5,
            "6_of_clubs": 6,
            "6_of_diamonds": 6,
            "6_of_hearts": 6,
            "6_of_spades": 6,
            "7_of_clubs": 7,
            "7_of_diamonds": 7,
            "7_of_hearts": 7,
            "7_of_spades": 7,
            "8_of_clubs": 8,
            "8_of_diamonds": 8,
            "8_of_hearts": 8,
            "8_of_spades": 8,
            "9_of_clubs": 9,
            "9_of_diamonds": 9,
            "9_of_hearts": 9,
            "9_of_spades": 9,
            "10_of_clubs": 10,
            "10_of_diamonds": 10,
            "10_of_hearts": 10,
            "10_of_spades": 10,
            "11_of_clubs": 11,
            "11_of_diamonds": 11,
            "11_of_hearts": 11,
            "11_of_spades": 11,
            "12_of_clubs": 12,
            "12_of_diamonds": 12,
            "12_of_hearts": 12,
            "12_of_spades": 12,
            "13_of_clubs": 13,
            "13_of_diamonds": 13,
            "13_of_hearts": 13,
            "13_of_spades": 13,
        ]
    }
    
    func getValue(for cardName: String) -> Int?{
        return cardValues[cardName]
    }
    
    func getImageName(for image: UIImage) -> String? {
        return image.imageAsset?.value(forKey: "assetName") as? String
    }
    
    func getRandomCard() -> [[String]]{
        let playerCount = 2
        let cardsPerPlayer = 10
        let shuffleCards = allCardNames.shuffled().prefix(playerCount * cardsPerPlayer)
        var cards: [[String]] = []
        for i in 0..<playerCount{
            let playerCards = Array(shuffleCards[(i * cardsPerPlayer)..<(i * cardsPerPlayer + cardsPerPlayer)])
            cards.append(playerCards)
        }
        return cards
    }
}
