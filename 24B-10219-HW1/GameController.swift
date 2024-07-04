
import Foundation
import UIKit

protocol CallBack_Score {
    func score(score1: Int, score2: Int, card1Value: Int?, card2Value: Int?)
}

class Detector {
    var callback: CallBack_Score?
    var timer: Timer?
    var score1 = 0
    var score2 = 0
    var cardsCounter = 0
    let cardValues: [String: Int]
    let imagesPlayer1: [UIImage]
    let imagesPlayer2: [UIImage]
    
    init(callBack: CallBack_Score, cardValues: [String: Int], imagesPlayer1: [UIImage], imagesPlayer2: [UIImage]) {
        self.callback = callBack
        self.cardValues = cardValues
        self.imagesPlayer1 = imagesPlayer1
        self.imagesPlayer2 = imagesPlayer2
    }
    
    func startGame() {
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: change(t:))
    }
    
    func change(t: Timer) {
        if cardsCounter < imagesPlayer1.count {
            let card1 = imagesPlayer1[cardsCounter]
            let card2 = imagesPlayer2[cardsCounter]
            
            let card1Value = cardValues[getImageName(for: card1)] ?? 0
            let card2Value = cardValues[getImageName(for: card2)] ?? 0
            
            if card1Value > card2Value {
                score1 += 1
            } else if card2Value > card1Value {
                score2 += 1
            }
            
            callback?.score(score1: score1, score2: score2, card1Value: card1Value, card2Value: card2Value)
            
            cardsCounter += 1
        } else {
            callback?.score(score1: score1, score2: score2, card1Value: nil, card2Value: nil)
            t.invalidate()
        }
    }
    
    func getImageName(for image: UIImage) -> String {
        if let assetName = image.imageAsset?.value(forKey: "assetName") as? String {
            return assetName
        }
        return ""
    }
}
