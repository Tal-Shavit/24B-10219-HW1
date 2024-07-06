import Foundation
import UIKit

class MainController: UIViewController {
    
    @IBOutlet weak var main_LBL_insertName: UILabel!
    @IBOutlet weak var main_LBL_userName: UILabel!
    @IBOutlet weak var main_BTN_start: UIButton!
    @IBOutlet weak var main_STACK_east: UIStackView!
    @IBOutlet weak var main_STACK_west: UIStackView!
    @IBOutlet weak var main_LBL_east: UILabel!
    @IBOutlet weak var main_LBL_side: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.removeObject(forKey: "userName")/////////////////////////////////to delete
        
        main_LBL_userName.isHidden = true
        main_BTN_start.isHidden = true
        main_STACK_east.isHidden = true
        main_STACK_west.isHidden = true
        main_LBL_side.isHidden = true
        
        
        let text = "Insert Name"
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
        
        main_LBL_insertName.attributedText = attributedString
        main_LBL_insertName.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(insertNameClicked))
        main_LBL_insertName.addGestureRecognizer(tap)
    }
    
    @IBAction func onClickStart(_ sender: Any) {
        if let startGameVC = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController{
            self.navigationController?.pushViewController(startGameVC, animated: true)
        }
    }
    
    @objc func insertNameClicked(){
        let alertController = UIAlertController(title: "Enter your name", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Your name"
        }
        let confirmAction = UIAlertAction(title: "OK", style: .default) { _ in
            if let name = alertController.textFields?.first?.text, !name.isEmpty {
                let capitalFirstLetter = name.capitalized
                UserDefaults.standard.set(capitalFirstLetter, forKey: "userName")
                if let userName = UserDefaults.standard.string(forKey: "userName"){
                    self.main_LBL_userName.text = "Hi \(userName)"
                    self.main_LBL_userName.isHidden = false
                    self.main_LBL_insertName.isHidden = true
                    self.main_STACK_east.isHidden = false
                    self.main_STACK_west.isHidden = false
                    self.main_LBL_east.backgroundColor = .yellow
                    self.main_LBL_side.isHidden = false
                    self.main_BTN_start.isHidden = false
                }
            }
        }
        alertController.addAction(confirmAction)
        present(alertController, animated: true, completion: nil)
    }
}
