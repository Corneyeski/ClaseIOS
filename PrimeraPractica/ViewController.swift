//
//  ViewController.swift
//  PrimeraPractica
//
//  Created by DAM on 11/10/17.
//  Copyright © 2017 DAM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var points = 0

    @IBOutlet weak var textoPuntos: UITextField!
    @IBOutlet weak var seconds: UITextField!

    @IBOutlet weak var num: UIButton!
    @IBOutlet weak var num2: UIButton!
    @IBOutlet weak var num3: UIButton!
    @IBOutlet weak var num4: UIButton!
    @IBOutlet weak var num5: UIButton!
    @IBOutlet weak var num6: UIButton!
    
    @IBOutlet weak var winer: UITextField!
    @IBOutlet weak var reboot: UIButton!
    
    var clock:Timer  = Timer() //= Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.countdown), userInfo: nil, repeats: true)
    
    var timer = 30;
    
    @IBAction func gameReboot(_ sender: Any) {
        
        winer.isHidden = true
        reboot.isHidden = true;
        
        startGame()
    }
    
    
    @IBAction func grupoBotones(_ sender: Any) {
        checkValue(check: sender as! UIButton)
        
        checkFinal()
    }
 
    
    var randomNumvers = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func startGame(){
        randomNumvers.removeAll()
        randomValues()
        putRandomValues()
        
        print("salgo de putRandomVALUES")
        num.isHidden = false;
        num2.isHidden = false;
        num3.isHidden = false;
        num4.isHidden = false;
        num5.isHidden = false;
        num6.isHidden = false;
        
        timer = 30;
        
        seconds.text = String(timer)
        
        print("aaa")
        

        
        clock = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.countdown), userInfo: nil, repeats: true)
    }
    
    
    func randomValues() {
        let lower = -100
        let upper = 100
        for _ in 1..<7 {
            print(randomNumvers.append(Int(arc4random_uniform(UInt32(upper - lower + 1))) +   lower))
        }
        
    }
    
    func putRandomValues(){
        num.setTitle("\(randomNumvers[0])", for: .normal)
        num2.setTitle("\(randomNumvers[1])", for: .normal)
        num3.setTitle("\(randomNumvers[2])", for: .normal)
        num4.setTitle("\(randomNumvers[3])", for: .normal)
        num5.setTitle("\(randomNumvers[4])", for: .normal)
        num6.setTitle("\(randomNumvers[5])", for: .normal)
        
        randomNumvers.sort()
        print(randomNumvers)
       
    }
    
    func checkValue(check:UIButton) {
        
        let value = check.currentTitle
        
        print(" eeooooo \(String(describing: value))")
        
        if Int(value!)! == randomNumvers[0] {
            randomNumvers.remove(at: 0)
            
            print("true")
            
            check.isHidden = true
        }
        else {
            print("false")
        }
    }
    
    func checkFinal(){
        if randomNumvers.count == 0 {
            
            winer.text = "HAS GANADO!"
            
            points += 1
            textoPuntos.text = String(points)
            
            showFinal()
        }
    }
    
    func countdown() {
        timer -= 1
        
        if timer < 1 {
            winer.text = "HAS PERDIDO!"
            showFinal()
        }
        
        seconds.text = String(timer)
    }

    func showFinal() {
        num.isHidden = true;
        num2.isHidden = true;
        num3.isHidden = true;
        num4.isHidden = true;
        num5.isHidden = true;
        num6.isHidden = true;
        
        winer.isHidden = false;
        reboot.isHidden = false;
        
        clock.invalidate()
    }
}

