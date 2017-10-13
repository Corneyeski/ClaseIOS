//
//  ViewController.swift
//  PrimeraPractica
//
//  Created by DAM on 11/10/17.
//  Copyright © 2017 DAM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var num: UIButton!
    @IBOutlet weak var num2: UIButton!
    @IBOutlet weak var num3: UIButton!
    @IBOutlet weak var num4: UIButton!
    @IBOutlet weak var num5: UIButton!
    @IBOutlet weak var num6: UIButton!
    
    
    @IBAction func grupoBotones(_ sender: Any) {
        switch (sender as AnyObject).tag {
        case 0:
            print("1")
            break
        case 1:
            print("2")
            break
        case 2:
            print("3")
            break
        case 3:
            print("4")
            break
        case 4:
            print("5")
            break
        case 5:
            print("6")
            break
            
        default:
            print("default")
        }
    }
 
    
    var randomNumvers = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        randomValues()
        putRandomValues()
        
//        num.addTarget(self, action: #selector(checkNumber(sender:self)), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func randomValues() {
        let lower = -100
        let upper = 100
        for _ in 1..<7 {
           //let valor = UInt32(generateRandomValues(lower: lower, upper: upper))
            print(randomNumvers.append(Int(arc4random_uniform(UInt32(upper - lower + 1))) +   lower))
        }
    }
    
    /*
    func generateRandomValues(lower:Int, upper:Int) -> Int {
        return
    }*/
    
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

}

