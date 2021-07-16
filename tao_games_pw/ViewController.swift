//
//  ViewController.swift
//  tao_games_pw
//
//  Created by PW on 7/10/21.
//

import UIKit

class ViewController: UIViewController {

    var onePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winner = [[0,1,2], [3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameIsActive = true
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func click(_ sender: AnyObject)
    {
        if (gameState[sender.tag - 1] == 0 && gameIsActive == true)
        {
            gameState[sender.tag - 1] = onePlayer
            
            if (onePlayer == 1)
            {
                sender.setImage(UIImage(named: "cross.jpg"), for: UIControl.State())
                onePlayer = 2
            }
            else
            {
                sender.setImage(UIImage(named: "round.jpg"), for: UIControl.State())
                onePlayer = 1
            }
        }
        
        for combination in winner
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] ==
                gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                gameIsActive = false
                if gameState[combination[0]] == 1
                {
                    label.text = "CROSS WIN!"
                    
                }
                else{
                    label.text = "ROUND WIN!"
                    
                }
                
                playAgainButton.isHidden = false
                label.isHidden = false
               
            }
        }
        gameIsActive = false
        
        for i in gameState
        {
            if i == 0
            {
                gameIsActive = true
                break
            }
        }
        
        if gameIsActive == false
        {
            label.text = "DRAW! AGAIN!"
            label.isHidden = false
            playAgainButton.isHidden = false
        }
        
    }
    
    
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: AnyObject)
    {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        onePlayer = 1
        
        playAgainButton.isHidden = true
        label.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
        }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

