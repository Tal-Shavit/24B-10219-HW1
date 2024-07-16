import Foundation
import UIKit
import CoreLocation

class MainController: UIViewController {
    
    @IBOutlet weak var main_LBL_insertName: UILabel!
    @IBOutlet weak var main_LBL_userName: UILabel!
    @IBOutlet weak var main_BTN_start: UIButton!
    @IBOutlet weak var main_STACK_east: UIStackView!
    @IBOutlet weak var main_STACK_west: UIStackView!
    @IBOutlet weak var main_LBL_east: UILabel!
    @IBOutlet weak var main_LBL_west: UILabel!
    @IBOutlet weak var main_LBL_side: UILabel!
    
    var locationManager : CLLocationManager!
    var isEast : Bool = false
    var locationRecived : Bool = false
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLocation()
        initViews()
        
        
        locationManager.startUpdatingLocation()
    }
    
    @IBAction func onClickStart(_ sender: Any) {
        if let startGameVC = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController{
            if let userName = UserDefaults.standard.string(forKey: "userName"){
                startGameVC.userName = userName
                startGameVC.isEast = self.isEast
            }
            self.navigationController?.pushViewController(startGameVC, animated: true)
        }
    }
    
    func initInsertName(){
        main_LBL_insertName.isHidden = false
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
    
    @objc func insertNameClicked(){
        let alertController = UIAlertController(title: "Enter your name", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Your name"
        }
        let confirmAction = UIAlertAction(title: "OK", style: .default) { _ in
            if let name = alertController.textFields?.first?.text, !name.isEmpty {
                let capitalFirstLetter = name.capitalized
                UserDefaults.standard.set(capitalFirstLetter, forKey: "userName")
                self.userName = capitalFirstLetter
                self.updateUI()
            }
        }
        alertController.addAction(confirmAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func initLocation(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func initViews(){
        self.main_LBL_userName.isHidden = true
        self.main_LBL_insertName.isHidden = true
        self.main_STACK_east.isHidden = true
        self.main_STACK_west.isHidden = true
        self.main_LBL_side.isHidden = true
        self.main_BTN_start.isHidden = true
        
        checkIfNameExist()
    }
    
    func checkIfNameExist(){
        if let userNameExist = UserDefaults.standard.string(forKey: "userName"){
            self.userName = userNameExist
            self.main_LBL_userName.text = "Hi \(userNameExist)"
            self.main_LBL_userName.isHidden = false
            self.main_LBL_insertName.isHidden = true
        }
        else{
            initInsertName()
        }
    }
    
    func updateUI(){
        if locationRecived ,let name = userName{
            self.main_LBL_userName.text = "Hi \(name)"
            self.main_LBL_userName.isHidden = false
            self.main_LBL_insertName.isHidden = true
            self.main_STACK_east.isHidden = false
            self.main_STACK_west.isHidden = false
            self.main_LBL_side.isHidden = false
            self.main_BTN_start.isHidden = false
            
            main_LBL_side.text = isEast ? "You Are At The East Side" : "You Are At The West Side"
            if isEast{
                addBoarder(to: main_LBL_east)
            }
            else{
                addBoarder(to: main_LBL_west)
            }
        } else if let _ = userName {
            self.main_LBL_userName.isHidden = false
            self.main_LBL_insertName.isHidden = true
            self.main_BTN_start.isHidden = true
        }
    }
    
    func addBoarder(to label: UILabel){
        let color = UIColor(named: "General")
        label.layer.borderColor = color?.cgColor
        label.layer.borderWidth = 1.5
        label.layer.cornerRadius = 8.0
        label.layer.masksToBounds = true
    }
}

extension MainController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations
                         locations: [CLLocation]) {
        
        if let location = locations.last{
            locationManager.stopUpdatingLocation()
            let lon = location.coordinate.longitude
            let middlePointLon = 34.817549168324334
            
            isEast = lon > middlePointLon
            self.locationRecived = true
            self.updateUI()
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error=\(error)")
    }
}
