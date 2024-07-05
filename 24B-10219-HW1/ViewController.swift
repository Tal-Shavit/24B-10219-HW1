
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var main_LBL_scorePlayer1: UILabel!
    
    @IBOutlet weak var main_LBL_scorePlayer2: UILabel!
    @IBOutlet weak var main_IMG_card1: UIImageView!
    
    @IBOutlet weak var main_IMG_card2: UIImageView!
    var imagesPlayer1 = [#imageLiteral(resourceName: "4_of_hearts"), #imageLiteral(resourceName: "2_of_diamonds"), #imageLiteral(resourceName: "9_of_hearts"), #imageLiteral(resourceName: "1_of_clubs"), #imageLiteral(resourceName: "3_of_diamonds"), #imageLiteral(resourceName: "2_of_diamonds"), #imageLiteral(resourceName: "10_of_clubs"), #imageLiteral(resourceName: "7_of_spades"), #imageLiteral(resourceName: "3_of_diamonds"), #imageLiteral(resourceName: "1_of_spades")]
    var imagesPlayer2 = [#imageLiteral(resourceName: "3_of_diamonds"), #imageLiteral(resourceName: "11_of_hearts"), #imageLiteral(resourceName: "4_of_clubs"), #imageLiteral(resourceName: "12_of_clubs"), #imageLiteral(resourceName: "2_of_clubs"), #imageLiteral(resourceName: "3_of_diamonds"), #imageLiteral(resourceName: "12_of_clubs"), #imageLiteral(resourceName: "9_of_spades"), #imageLiteral(resourceName: "1_of_hearts"), #imageLiteral(resourceName: "1_of_diamonds")]
    var score1 = 0, score2 = 0
    var myDetector : Detector?
    let backCardImage = UIImage(named: "card")
    
    
    let cardValues: [String: Int] = [
        "8_of_spades": 8,
        "2_of_diamonds": 2,
        "9_of_hearts": 9,
        "1_of_clubs": 1,
        "3_of_diamonds": 3,
        "10_of_clubs": 10,
        "7_of_spades": 7,
        "1_of_spades": 1,
        "11_of_hearts": 11,
        "4_of_clubs": 4,
        "4_of_hearts": 4,
        "12_of_clubs": 12,
        "2_of_clubs": 2,
        "9_of_spades": 9,
        "1_of_hearts": 1,
        "1_of_diamonds": 1
    ]
    
    override func viewDidLoad() {
           super.viewDidLoad()
        main_LBL_scorePlayer1.text = "\(0)"
        main_LBL_scorePlayer2.text = "\(0)"
        main_IMG_card1.image = backCardImage
        main_IMG_card2.image = backCardImage
           myDetector = Detector(callBack: self, cardValues: cardValues, imagesPlayer1: imagesPlayer1, imagesPlayer2: imagesPlayer2, backCardImage: backCardImage)
           myDetector?.startGame()
       }
   }

   extension ViewController: CallBack_Score {
       func score(currentCard: Int, card1Value: Int?, card2Value: Int?, showBack: Bool) {
           if showBack {
               main_IMG_card1.image = backCardImage
               main_IMG_card2.image = backCardImage
           } else if currentCard < imagesPlayer1.count {
               let card1 = imagesPlayer1[currentCard]
               let card2 = imagesPlayer2[currentCard]
               
              changeScore(card1Value: card1Value, card2Value: card2Value)
               
               main_IMG_card1.image = card1
               main_IMG_card2.image = card2
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
               navigationController?.pushViewController(gameOverVC, animated: true)
           }
       }
   }
