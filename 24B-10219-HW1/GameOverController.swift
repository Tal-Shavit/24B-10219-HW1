//
//  GameOverController.swift
//  24B-10219-HW1
//
//  Created by Student8 on 05/07/2024.
//

import Foundation
import UIKit

class GameOverController: UIViewController {
    
    @IBOutlet weak var gameOver_LBL_name: UILabel!
    @IBOutlet weak var gameOver_LBL_score: UILabel!
    
    var name : String = ""
    var score : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
    
        gameOver_LBL_name.text = "\(name)"
        gameOver_LBL_score.text = "\(score)"
        
    }
    
    @IBAction func onBackToMenu(_ sender: UIButton) {
        if let navigationController = navigationController {
            for viewControllers in navigationController.viewControllers {
                        if viewControllers is MainController {
                            navigationController.popToViewController(viewControllers, animated: true)
                            return
                        }
                    }
                }
    }
}
