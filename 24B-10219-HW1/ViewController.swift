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
    
    private var imagesPalyer1 = [#imageLiteral(resourceName: "8_of_spades"), #imageLiteral(resourceName: "2_of_diamonds"), #imageLiteral(resourceName: "9_of_hearts"), #imageLiteral(resourceName: "1_of_clubs"), #imageLiteral(resourceName: "3_of_diamonds"), #imageLiteral(resourceName: "2_of_diamonds"), #imageLiteral(resourceName: "10_of_clubs"), #imageLiteral(resourceName: "7_of_spades"), #imageLiteral(resourceName: "3_of_diamonds"), #imageLiteral(resourceName: "1_of_spades")]
    private var imagesPalyer2 = [#imageLiteral(resourceName: "3_of_diamonds"), #imageLiteral(resourceName: "11_of_hearts"), #imageLiteral(resourceName: "4_of_clubs"), #imageLiteral(resourceName: "12_of_clubs"), #imageLiteral(resourceName: "2_of_clubs"), #imageLiteral(resourceName: "3_of_diamonds"), #imageLiteral(resourceName: "12_of_clubs"), #imageLiteral(resourceName: "9_of_spades"), #imageLiteral(resourceName: "1_of_hearts"), #imageLiteral(resourceName: "1_of_diamonds")]
    var currentIndex = 0
    
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
        // Do any additional setup after loading the view.
    }

    @IBAction func onClick(_ sender: Any) {
        if (currentIndex < imagesPalyer1.count){
            let imageName1 = getImageName(for: imagesPalyer1[currentIndex])
            let imageName2 = getImageName(for: imagesPalyer2[currentIndex])
            
            main_IMG_card1.image = imagesPalyer1[currentIndex]
            main_IMG_card2.image = imagesPalyer2[currentIndex]
            
            if let value1 = cardValues[imageName1], let value2 = cardValues[imageName2]{
                main_LBL_number1.text = "\(value1)"
                main_LBL_number2.text = "\(value2)"
            }
            
            currentIndex += 1
        }
        else{
            currentIndex = 0
            let imageName1 = getImageName(for: imagesPalyer1[currentIndex])
            let imageName2 = getImageName(for: imagesPalyer2[currentIndex])
            
            main_IMG_card1.image = imagesPalyer1[currentIndex]
            main_IMG_card2.image = imagesPalyer2[currentIndex]
            
            main_LBL_number1.text = imageName1;
            main_LBL_number2.text = imageName2;
            
            currentIndex += 1
        }
        
    }
    
    func getImageName(for image: UIImage) -> String{
        if let assetName = image.imageAsset?.value(forKey: "assetName") as? String{
            return assetName
        }
        return ""
    }
    
}

