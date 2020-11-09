//
//  ViewController.swift
//  Choose The Flag
//
//  Created by Akshay Ramesh on 11/8/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topFlag: UIButton!
    @IBOutlet weak var middleFlag: UIButton!
    @IBOutlet weak var bottomFlag: UIButton!
    
    let flagImages = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    var actualAnswer: Int? = nil
    var actualAnswerSet = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        pick3RandomFlagsAndTitle()
    }
    
    func pick3RandomFlagsAndTitle() {
        var randomNumberArray = [Int]()
        let randomNumber1 = Int.random(in: 0..<flagImages.count)
        randomNumberArray.append(randomNumber1)
        actualAnswerSet.append(flagImages[randomNumber1])
        let randomNumber2 = Int.random(in: 0..<flagImages.count)
        randomNumberArray.append(randomNumber2)
        actualAnswerSet.append(flagImages[randomNumber2])
        let randomNumber3 = Int.random(in: 0..<flagImages.count)
        randomNumberArray.append(randomNumber3)
        actualAnswerSet.append(flagImages[randomNumber3])
        let randomElementFromRandomArray = randomNumberArray.randomElement()!
        topFlag.setBackgroundImage(UIImage(named: flagImages[randomNumber1]), for: .normal)
        middleFlag.setBackgroundImage(UIImage(named: flagImages[randomNumber2]), for: .normal)
        bottomFlag.setBackgroundImage(UIImage(named: flagImages[randomNumber3]), for: .normal)
        actualAnswer = randomElementFromRandomArray
        title = flagImages[randomElementFromRandomArray].uppercased()
    }
    
    @IBAction func clickFlag(_ sender: UIButton) {
        let chosenAnswer = sender.tag
        if actualAnswerSet[chosenAnswer] == flagImages[actualAnswer!] {
            showAlert(alertTitle: "Correct", alertMessage: "Your chosen Answer is right!")
        } else {
            showAlert(alertTitle: "Wrong", alertMessage: "Your chosen Answer is wrong, because you chose \(actualAnswerSet[chosenAnswer].uppercased())")
        }
    }
    
    func showAlert(alertTitle: String, alertMessage: String) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { _ in
            self.actualAnswer = 0
            self.actualAnswerSet = []
            self.pick3RandomFlagsAndTitle()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}

