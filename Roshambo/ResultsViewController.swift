//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Nicole Zheng on 9/23/20.
//

import UIKit

enum Shape: String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
    
    static func randomShape() -> Shape {
        let shapes = ["Rock", "Paper", "Scissors"]
        let randomChoice = Int(arc4random_uniform(3))
        return Shape(rawValue: shapes[randomChoice])!
    }
}

// MARK: - ResultsViewController: UIViewController

class ResultsViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet private weak var itsATie: UIImageView!
    @IBOutlet private weak var tieLabel: UILabel!
    
    // MARK: Properties
        
    var userChoice: Shape!
    private let opponentChoice: Shape = Shape.randomShape()
    
    // MARK: Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayResult()
    }
    
    // MARK: UI
    
    private func displayResult() {
        var imageName: String
        var text: String
        let matchup = "\(userChoice.rawValue) vs.\(opponentChoice.rawValue)"
        
        switch (userChoice!, opponentChoice) {
        case let (user, opponent) where user == opponent:
            text = "\(matchup): it's a tie!"
            imageName = "tie"
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            text = "You win with \(matchup)!"
            imageName = "\(userChoice.rawValue)-\(opponentChoice.rawValue)"
        default:
            text = "You lose with \(matchup)."
            imageName = "\(opponentChoice.rawValue)-\(userChoice.rawValue)"
        }
        
        imageName = imageName.lowercased()
        itsATie.image = UIImage(named: imageName)
        tieLabel.text = text
    }
    
    // MARK: Actions
    
    @IBAction private func tryAgain() {
        dismiss(animated: true, completion: nil)
    }
}
