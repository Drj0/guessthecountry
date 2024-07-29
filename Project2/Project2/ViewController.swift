

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["france", "germany", "italy", "ireland", "monaco", "nigeria", "russia", "spain", "us", "uk", "estonia"]
        
        //        button1.layer.borderWidth = 0.5
        //        button2.layer.borderWidth = 0.5
        //        button3.layer.borderWidth = 0.5
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        
        askQuestion(action: nil)
    }
    
    func askQuestion(action: UIAlertAction!){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[2]), for: .normal)
        button1.setImage(UIImage(named: countries[1]), for: .normal)
        button1.setImage(UIImage(named: countries[0 ]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
        
    }
    
    @IBAction func buttontapped(_ sender: UIButton) {
        
        var title: String

        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "your score is \(score)", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
                                   
                    
    }
    
    
    
    
}



