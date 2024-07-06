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
    
    @IBAction func onBackToMenu(_ sender: Any) {
        if let navigationController = navigationController {
                    for view in navigationController.viewControllers {
                        if view is MainController {
                            navigationController.popToViewController(view, animated: true)
                            return
                        }
                    }
                }
    }
}
