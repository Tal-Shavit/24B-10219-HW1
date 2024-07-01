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
    private var imagesPalyer1 = [#imageLiteral(resourceName: "8_of_spades"), #imageLiteral(resourceName: "2_of_diamonds"), #imageLiteral(resourceName: "9_of_hearts"), #imageLiteral(resourceName: "1_of_clubs"), #imageLiteral(resourceName: "3_of_diamonds"), #imageLiteral(resourceName: "2_of_diamonds"), #imageLiteral(resourceName: "10_of_clubs"), #imageLiteral(resourceName: "7_of_spades"), #imageLiteral(resourceName: "3_of_diamonds"), #imageLiteral(resourceName: "1_of_spades")]
    private var imagesPalyer2 = [#imageLiteral(resourceName: "3_of_diamonds"), #imageLiteral(resourceName: "11_of_hearts"), #imageLiteral(resourceName: "4_of_clubs"), #imageLiteral(resourceName: "12_of_clubs"), #imageLiteral(resourceName: "2_of_clubs"), #imageLiteral(resourceName: "3_of_diamonds"), #imageLiteral(resourceName: "12_of_clubs"), #imageLiteral(resourceName: "9_of_spades"), #imageLiteral(resourceName: "1_of_hearts"), #imageLiteral(resourceName: "1_of_diamonds")]
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClick(_ sender: Any) {
        if (currentIndex < imagesPalyer1.count){
            main_IMG_card1.image = imagesPalyer1[currentIndex]
            main_IMG_card2.image = imagesPalyer2[currentIndex]
            currentIndex += 1
        }
        else{
            currentIndex = 0
            main_IMG_card1.image = imagesPalyer1[currentIndex]
            main_IMG_card2.image = imagesPalyer2[currentIndex]
            currentIndex += 1
        }
        
    }
    
}

