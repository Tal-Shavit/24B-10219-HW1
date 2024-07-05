
import Foundation
import UIKit

protocol CallBack_Score {
    func score(currentCard: Int, card1Value: Int?, card2Value: Int?, showBack: Bool)
}

class Detector {
    var callback: CallBack_Score?
    var timer: Timer?
    var currentCard = 0
    var timerCount = 0
    var score1 = 0
    var score2 = 0
    let cardValues: [String: Int]
    let imagesPlayer1: [UIImage]
    let imagesPlayer2: [UIImage]
    let backCardImage: UIImage?
    
    init(callBack: CallBack_Score, cardValues: [String: Int], imagesPlayer1: [UIImage], imagesPlayer2: [UIImage], backCardImage: UIImage?) {
        self.callback = callBack
        self.cardValues = cardValues
        self.imagesPlayer1 = imagesPlayer1
        self.imagesPlayer2 = imagesPlayer2
        self.backCardImage = backCardImage
    }
    
    func startGame() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: updateGame(t:))
        }
    
    func updateGame(t: Timer){
        switch timerCount{
        case 0:
            if currentCard < imagesPlayer1.count {
                let card1 = imagesPlayer1[currentCard]
                let card2 = imagesPlayer2[currentCard]
                
                let card1Value = cardValues[getImageName(for: card1)] ?? 0
                let card2Value = cardValues[getImageName(for: card2)] ?? 0
               
                callback?.score(currentCard: currentCard, card1Value: card1Value, card2Value: card2Value, showBack: false)
                
                if card1Value > card2Value{
                    score1 += 1
                }
                else if card2Value > card1Value{
                    score2 += 1
                }

            } else {
                t.invalidate()
            }
        case 3:
            callback?.score(currentCard: currentCard, card1Value: nil, card2Value: nil, showBack: true)
            currentCard += 1
        default:
            break
        }
        timerCount = (timerCount + 1) % 5
    }
    
    func getImageName(for image: UIImage) -> String {
        if let assetName = image.imageAsset?.value(forKey: "assetName") as? String {
            return assetName
        }
        return ""
    }
}
