
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var main_LBL_scorePlayer1: UILabel!
    @IBOutlet weak var main_LBL_scorePlayer2: UILabel!
    @IBOutlet weak var main_IMG_card1: UIImageView!
    @IBOutlet weak var main_IMG_card2: UIImageView!
    
    @IBOutlet weak var main_LBL_seconds: UILabel!
    var imagesPlayer1 : [UIImage] = []
    var imagesPlayer2 : [UIImage] = []
    var score1 = 0, score2 = 0
    var myDetector : Detector?
    let backCardImage = UIImage(named: "back_card")
    var winnerScore = 0
    var winnerName = ""

    
    override func viewDidLoad() {
           super.viewDidLoad()
        
        let playerCards = CardManeger.shared.getRandomCard()
        let player1Cards = playerCards[0]
        let player2Cards = playerCards[1]
        
        imagesPlayer1 = player1Cards.compactMap{ UIImage(named: $0)}
        imagesPlayer2 = player2Cards.compactMap{ UIImage(named: $0)}
        
        main_LBL_seconds.text = "\(0)"
        main_LBL_scorePlayer1.text = "\(0)"
        main_LBL_scorePlayer2.text = "\(0)"
        main_IMG_card1.image = backCardImage
        main_IMG_card2.image = backCardImage
        
           myDetector = Detector(callBack: self, imagesPlayer1: imagesPlayer1, imagesPlayer2: imagesPlayer2)
           myDetector?.startGame()
       }
    
    func flipCard(_ imageView: UIImageView, toImage: UIImage) {
            UIView.transition(with: imageView, duration: 0.5, options: .transitionFlipFromRight, animations: {
                imageView.image = toImage
            }, completion: nil)
        }
   }

extension ViewController: CallBack_Score {
    func seconds(time: Int) {
        main_LBL_seconds.text = "\(time)"
    }
    
       func score(currentCard: Int, card1Value: Int?, card2Value: Int?, showBack: Bool) {
           if showBack {
               flipCard(main_IMG_card1, toImage: backCardImage!)
               flipCard(main_IMG_card2, toImage: backCardImage!)
           } else if currentCard < imagesPlayer1.count {
               let card1 = imagesPlayer1[currentCard]
               let card2 = imagesPlayer2[currentCard]
               
              changeScore(card1Value: card1Value, card2Value: card2Value)
               
               flipCard(main_IMG_card1, toImage: card1)
               flipCard(main_IMG_card2, toImage: card2)
           }
       }
       
       func changeScore(card1Value: Int?, card2Value: Int?){
           if let card1Value = card1Value, let card2Value = card2Value {
               DispatchQueue.main.asyncAfter(deadline: .now()+1){
                   if(card1Value > card2Value){
                       self.score1 += 1
                       self.main_LBL_scorePlayer1.text = "\(self.score1)"
                   }
                   else if(card2Value > card1Value){
                       self.score2 += 1
                       self.main_LBL_scorePlayer2.text = "\(self.score2)"
                   }
               }
               
           }
       }
       
       func gameOver() {
           if let gameOverVC = storyboard?.instantiateViewController(withIdentifier: "GameOverController") as? GameOverController{
               checkWinner()
               gameOverVC.name = winnerName
               gameOverVC.score = winnerScore
               self.navigationController?.pushViewController(gameOverVC, animated: true)
           }
       }
    
    func checkWinner(){
        if(score1 > score2){
            winnerName = "Player1"
            winnerScore = score1
        } else{
            winnerName = "Player2"
            winnerScore = score2
        }
    }
   }
