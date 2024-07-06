
import Foundation
import UIKit

protocol CallBack_Score {
    func seconds(time: Int)
    func score(currentCard: Int, card1Value: Int?, card2Value: Int?, showBack: Bool)
    func gameOver()
}

class Detector {
    var callback: CallBack_Score?
    var timer: Timer?
    var currentCard = 0
    var timerCount = 0
    var seconds = 0
  
    let imagesPlayer1: [UIImage]
    let imagesPlayer2: [UIImage]
    
    init(callBack: CallBack_Score, imagesPlayer1: [UIImage], imagesPlayer2: [UIImage]) {
        self.callback = callBack
        self.imagesPlayer1 = imagesPlayer1
        self.imagesPlayer2 = imagesPlayer2
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
                
                if let card1Name = CardManeger.shared.getImageName(for: card1), let card2Name = CardManeger.shared.getImageName(for: card2){
                    let card1Value = CardManeger.shared.getValue(for: card1Name)
                    let card2Value = CardManeger.shared.getValue(for: card2Name)
                    
                    callback?.score(currentCard: currentCard, card1Value: card1Value, card2Value: card2Value, showBack: false)
                    
                    
                }

            } else {
                t.invalidate()
                callback?.gameOver()
            }
        case 3:
            callback?.score(currentCard: currentCard, card1Value: nil, card2Value: nil, showBack: true)
            currentCard += 1
        default:
            break
        }
        timerCount = (timerCount + 1) % 5
        
        seconds += 1
        callback?.seconds(time: seconds)
        if(seconds == 5){
            seconds = 0
        }
        
    }
    
    func getImageName(for image: UIImage) -> String? {
        return image.imageAsset?.value(forKey: "assetName") as? String
    }
}
