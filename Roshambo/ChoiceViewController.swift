//
//  ChoiceViewController.swift
//  Roshambo
//
//  Created by Nicole Zheng on 9/23/20.
//

import UIKit

// MARK: ChoiceViewController: UIViewController

class ChoiceViewController: UIViewController {

    // MARK: Programmatic Approach
    
    @IBAction func playRock(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        vc.userChoice = getUserShape(sender)
        present(vc, animated: true, completion: nil)
    }
    
    // Mark: Segue with Code Approach
    
        @IBAction func playPaper(_ sender: UIButton) {
        performSegue(withIdentifier: "play", sender: sender)
    }
    
    // MARK: Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "play" {
            let vc = segue.destination as! ResultsViewController
            vc.userChoice = getUserShape(sender as! UIButton)
        }
    }
    
    //MARK: Utilities
    
    private func getUserShape(_ sender: UIButton) -> Shape {
        let shape = sender.title(for:UIControl.State())!
        return Shape(rawValue: shape)!
    }
}

