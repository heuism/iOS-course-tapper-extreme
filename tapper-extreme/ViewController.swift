//
//  ViewController.swift
//  tapper-extreme
//
//  Created by Hien Tran on 24/06/2016.
//  Copyright © 2016 HienTran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Properties
    var maxTap = 0
    var currentTap = 0
    
    
    //Outlet
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var tapLbl: UILabel!
    
    //Action
    @IBAction func onPlayBtnPressed(sender: UIButton!){
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != "" {
            maxTap = Int(howManyTapsTxt.text!)!
            currentTap = 0
            
            logoImg.hidden = true
            howManyTapsTxt.hidden = true
            playBtn.hidden = true
            
            tapBtn.hidden = false
            tapLbl.hidden = false
            
            updateTapLbl()
        }
    }
    
    @IBAction func onCoinTapped(sender: UIButton!){
        currentTap++
        if isGameOver() {
            reStartTheGame()
        }
        updateTapLbl()
    }
    
    func reStartTheGame() {
        maxTap = 0
        howManyTapsTxt.text = ""
        
        logoImg.hidden = false
        howManyTapsTxt.hidden = false
        playBtn.hidden = false
        
        tapBtn.hidden = true
        tapLbl.hidden = true
    }
    
    func isGameOver() -> Bool {
        if currentTap >= maxTap{
            return true
        }
        return false
    }
    
    func updateTapLbl() {
        tapLbl.text = "\(currentTap) Taps"
    }

}

