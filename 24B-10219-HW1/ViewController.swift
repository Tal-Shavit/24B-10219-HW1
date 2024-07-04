//
//  ViewController.swift
//  24B-10219-HW1
//
//  Created by Student8 on 01/07/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var main_IMG_card1: UIImageView!
    @IBOutlet weak var main_IMG_card2: UIImageView!
    @IBOutlet weak var main_LBL_number1: UILabel!
    @IBOutlet weak var main_LBL_number2: UILabel!
    @IBOutlet weak var main_LBL_score1: UILabel!
    @IBOutlet weak var main_LBL_score2: UILabel!
    
    var imagesPlayer1 = [#imageLiteral(resourceName: "8_of_spades"), #imageLiteral(resourceName: "2_of_diamonds"), #imageLiteral(resourceName: "9_of_hearts"), #imageLiteral(resourceName: "1_of_clubs"), #imageLiteral(resourceName: "3_of_diamonds"), #imageLiteral(resourceName: "2_of_diamonds"), #imageLiteral(resourceName: "10_of_clubs"), #imageLiteral(resourceName: "7_of_spades"), #imageLiteral(resourceName: "3_of_diamonds"), #imageLiteral(resourceName: "1_of_spades")]
    var imagesPlayer2 = [#imageLiteral(resourceName: "3_of_diamonds"), #imageLiteral(resourceName: "11_of_hearts"), #imageLiteral(resourceName: "4_of_clubs"), #imageLiteral(resourceName: "12_of_clubs"), #imageLiteral(resourceName: "2_of_clubs"), #imageLiteral(resourceName: "3_of_diamonds"), #imageLiteral(resourceName: "12_of_clubs"), #imageLiteral(resourceName: "9_of_spades"), #imageLiteral(resourceName: "1_of_hearts"), #imageLiteral(resourceName: "1_of_diamonds")]
    var currentIndex = 0
    var score1 = 0
    var score2 = 0
    var myDetector: Detector?
    
    
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
        "12_of_clubs": 12,
        "2_of_clubs": 2,
        "9_of_spades": 9,
        "1_of_hearts": 1,
        "1_of_diamonds": 1
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myDetector = Detector(callBack: self, cardValues: cardValues, imagesPlayer1: imagesPlayer1, imagesPlayer2: imagesPlayer2)
        myDetector?.startGame()
    }
            
    func updateUI(card1Value: Int?, card2Value: Int?) {
        if currentIndex < imagesPlayer1.count {
            let card1 = imagesPlayer1[currentIndex]
            let card2 = imagesPlayer2[currentIndex]
                    
            main_IMG_card1.image = card1
            main_IMG_card2.image = card2
                    
            main_LBL_number1.text = "\(card1Value)"
            main_LBL_number2.text = "\(card2Value)"
            main_LBL_score1.text = "\(score1)"
            main_LBL_score2.text = "\(score2)"
                    
            currentIndex += 1
        }
        }
    }

    extension ViewController: CallBack_Score {
        func score(score1: Int, score2: Int, card1Value: Int?, card2Value: Int?) {
            self.score1 = score1
            self.score2 = score2
            if currentIndex >= imagesPlayer1.count {
                main_LBL_number1.text = "Game Over"
                main_LBL_number2.text = ""
                main_IMG_card1.image = nil
                main_IMG_card2.image = nil
            }else {
                updateUI(card1Value: card1Value, card2Value: card2Value)
            }
            
        }
    }
