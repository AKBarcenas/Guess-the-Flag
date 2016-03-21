//
//  ViewController.swift
//  Guess the Flag
//
//  Created by Alex on 12/20/15.
//  Copyright © 2015 Alex Barcenas. All rights reserved.
//

import GameplayKit
import UIKit

class ViewController: UIViewController {
    
    // Buttons displaying flags for the game.
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    // The list of countries that are used in the game.
    var countries = [String]()
    // The correct answer chosen for the current round.
    var correctAnswer = 0
    // The player's current score.
    var score = 0

    /*
     * Function Name: viewDidLoad
     * Parameters: None
     * Purpose: This method initializes the countries we will use and adds some styling to the buttons.
     *   Then the player is asked a question.
     * Return Value: None
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGrayColor().CGColor
        button2.layer.borderColor = UIColor.lightGrayColor().CGColor
        button3.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        askQuestion()
    }
    
    /*
     * Function Name: askQuestion
     * Parameters: action - the alert that the user will get
     * Purpose: This method randomly chooses three countries and asks the user to match one of
     *   those countries with the correct flag displayed on one of the buttons.
     * Return Value: None
     */
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
        button1.setImage(UIImage(named: countries[0]), forState: .Normal)
        button2.setImage(UIImage(named: countries[1]), forState: .Normal)
        button3.setImage(UIImage(named: countries[2]), forState: .Normal)
        correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
        title = countries[correctAnswer].uppercaseString
    }
    
    /*
     * Function Name: buttonTapped
     * Parameters: sender - the button that was pressed
     * Purpose: This method checks if the user got the correct answer and alerts the
     *   user what their new score is.
     * Return Value: None
     */
    
    @IBAction func buttonTapped(sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            ++score
        }
            
        else {
            title = "Wrong"
            --score
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion))
        presentViewController(ac, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

