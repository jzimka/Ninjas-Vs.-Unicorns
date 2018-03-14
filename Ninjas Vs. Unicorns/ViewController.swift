//
//  ViewController.swift
//  Ninjas Vs. Unicorns
//
//  Created by Joe Zimka on 7/26/17.
//  Copyright © 2017 Joe Zimka. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController
{
    
    
    
    @IBOutlet weak var box1: UIImageView!
    @IBOutlet weak var box2: UIImageView!
    @IBOutlet weak var box3: UIImageView!
    @IBOutlet weak var box4: UIImageView!
    @IBOutlet weak var box5: UIImageView!
    @IBOutlet weak var box6: UIImageView!
    @IBOutlet weak var box7: UIImageView!
    @IBOutlet weak var box8: UIImageView!
    @IBOutlet weak var box9: UIImageView!
    @IBOutlet weak var soundBox: UIImageView!
    var soundOnPressed = true
    var player = true
    var counter = 0
    var player2: AVAudioPlayer?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        soundBox.image = UIImage(named: "soundon")
        //label.backroundimage = image
        // function for empty space o
        
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        playSound()
    }
    
    
    
    func playSound()
    {
        guard let url = Bundle.main.url(forResource: "mortalkombat", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player2 = try AVAudioPlayer(contentsOf: url)
            guard let player2 = player2 else { return }
            
            player2.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    func catsGameAlert(word: String){
        let tieAlert = UIAlertController(title: word, message: "The Fight Must Continue!", preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Fight!!!", style: .destructive, handler: nil)
        tieAlert.addAction(closeAction)
        self.present (tieAlert, animated: true, completion: nil)
        resetLabels(closeAction)
        counter = 0
        player = true
        
        
    }
    func presentWinningAlert(_ word: String)
    {
        let presentWinningAlert = UIAlertController(title: word, message: "Let's Battle Again!!!", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "FIGHT!!!", style: .destructive, handler: resetLabels)
        presentWinningAlert.addAction(okayAction)
        present(presentWinningAlert,animated: true, completion: nil)
        resetLabels(okayAction)
        counter = 0
        player = true
        
    }
    
    
    func resetLabels(_ sender: UIAlertAction)
    {
        box1.image = nil
        box2.image = nil
        box3.image = nil
        box4.image = nil
        box5.image = nil
        box6.image = nil
        box7.image = nil
        box8.image = nil
        box9.image = nil
    }
    
    func checkforWinner()
    {
        
        if box1.image == box2.image && box2.image == box3.image && box3.image != nil
        {
            presentWinningAlert("VICTORY")
        }
        else if box4.image == box5.image && box5.image == box6.image && box6.image != nil        {
            presentWinningAlert("VICTORY")
        }
        else if box7.image == box8.image && box8.image == box9.image && box9.image != nil
        {
            presentWinningAlert("VICTORY")
        }
        else if box1.image == box4.image && box4.image == box7.image && box7.image != nil
        {
            presentWinningAlert("VICTORY")
        }
        else if box2.image == box5.image && box5.image == box8.image && box8.image != nil
        {
            presentWinningAlert("VICTORY")
        }
        else if box3.image == box6.image && box6.image == box9.image && box9.image != nil
        {
            presentWinningAlert("VICTORY")
        }
        else if box1.image == box5.image && box5.image == box9.image && box9.image != nil
        {
            presentWinningAlert("VICTORY")
        }
        else if box3.image == box5.image && box5.image == box7.image && box7.image != nil
        {
            presentWinningAlert("VICTORY")
        }
        else if counter == 9 {
            catsGameAlert(word: "No Worthy Victor!")
        }
        
    }
    
    
    
    @IBAction func whenButtonTapped(_ sender: UITapGestureRecognizer)
    {           let selectedPoint = sender.location(in: view)
        print(selectedPoint)
        if soundBox.frame.contains(selectedPoint) && soundOnPressed == true{
            soundBox.image = UIImage(named: "soundoff")
            player2?.pause()
            soundOnPressed = false
        } else if soundBox.frame.contains(selectedPoint) && soundOnPressed == false{
            soundBox.image = UIImage(named: "soundon")
            player2?.play()
            soundOnPressed = true
        }
        
        if player {
            if box1.frame.contains(selectedPoint) && box1.image == nil{
                box1.image = UIImage(named: "unicorn")
                counter += 1
                player = false
            }else if box2.frame.contains(selectedPoint) && box2.image == nil{
                box2.image = UIImage(named: "unicorn")
                counter += 1
                player = false
            }else if box3.frame.contains(selectedPoint) && box3.image == nil{
                box3.image = UIImage(named: "unicorn")
                counter += 1
                player = false
            }else if box4.frame.contains(selectedPoint) && box4.image == nil{
                box4.image = UIImage(named: "unicorn")
                counter += 1
                player = false
            }else if box5.frame.contains(selectedPoint) && box5.image == nil{
                box5.image = UIImage(named: "unicorn")
                counter += 1
                player = false
            }else if box6.frame.contains(selectedPoint) && box6.image == nil{
                box6.image = UIImage(named: "unicorn")
                counter += 1
                player = false
            }else if box7.frame.contains(selectedPoint) && box7.image == nil{
                box7.image = UIImage(named: "unicorn")
                counter += 1
                player = false
            }else if box8.frame.contains(selectedPoint) && box8.image == nil{
                box8.image = UIImage(named: "unicorn")
                counter += 1
                player = false
            }else if box9.frame.contains(selectedPoint) && box9.image == nil{
                box9.image = UIImage(named: "unicorn")
                counter += 1
                player = false
            }
            // player = false
        }
        else if player == false{
            if box1.frame.contains(selectedPoint) && box1.image == nil{
                box1.image = UIImage(named: "ninja")
                counter += 1
                player = true
            }else if box2.frame.contains(selectedPoint) && box2.image == nil{
                box2.image = UIImage(named: "ninja")
                counter += 1
                player = true
            }else if box3.frame.contains(selectedPoint) && box3.image == nil{
                box3.image = UIImage(named: "ninja")
                counter += 1
                player = true
            }else if box4.frame.contains(selectedPoint) && box4.image == nil{
                box4.image = UIImage(named: "ninja")
                counter += 1
                player = true
            }else if box5.frame.contains(selectedPoint) && box5.image == nil{
                box5.image = UIImage(named: "ninja")
                counter += 1
                player = true
            }else if box6.frame.contains(selectedPoint) && box6.image == nil{
                box6.image = UIImage(named: "ninja")
                counter += 1
                player = true
            }else if box7.frame.contains(selectedPoint) && box7.image == nil{
                box7.image = UIImage(named: "ninja")
                counter += 1
                player = true
            }else if box8.frame.contains(selectedPoint) && box8.image == nil{
                box8.image = UIImage(named: "ninja")
                counter += 1
                player = true
            }else if box9.frame.contains(selectedPoint) && box9.image == nil{
                box9.image = UIImage(named: "ninja")
                counter += 1
                player = true
                
                
            }
            
            //player = true
        }
        checkforWinner()
        
    }
}



